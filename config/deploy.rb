require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'yaml'
require 'io/console'

%w[base check mysql nginx].each do |pkg|
  require "#{File.join(__dir__,'deploy','recipes', pkg)}"
end

set :application, 'gwalg'
set :user, 'deploy'
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :repository, repository_url
set :branch, set_branch
set :rvm_use_path, "/home/#{fetch(:user)}/.rvm/scripts/rvm"
set :ruby_version, "#{File.readlines(File.join(__dir__, '..', '.ruby-version')).first.strip}"
set :gemset, "#{File.readlines(File.join(__dir__, '..', '.ruby-gemset')).first.strip}"
set :shared_dirs, fetch(:shared_dirs, []).push('storage', 'tmp/pids')
set :shared_files, fetch(:shared_file, []).push(
    'config/database.yml',
    'config/storage.yml',
    'config/master.key'
)

set :term_mode, :nil
set :ubuntu_code_name, 'bionic'

task :remote_environment do
  set :rails_env, ENV['on'].to_sym unless ENV['on'].nil?
  require "#{File.join(__dir__, 'deploy', "#{fetch(:rails_env)}_configurations_files", "#{fetch(:rails_env)}.rb")}"
  invoke :'rvm:use', "ruby-#{fetch(:ruby_version)}@#{fetch(:gemset)}"
end

task setup_prerequisites: :remote_environment do
  set :rails_env, ENV['on'].to_sym unless ENV['on'].nil?
  require "#{File.join(__dir__, 'deploy', "#{fetch(:rails_env)}_configurations_files", "#{fetch(:rails_env)}.rb")}"

  command %[sudo -A apt-get update]
  ['software-properties-common',
   'libmysqlclient-dev',
   'imagemagick',
   'libmagickwand-dev',
   'nodejs',
   'build-essential',
   'zlib1g-dev',
   'libssl-dev',
   'libreadline-dev',
   'libyaml-dev',
   'libcurl4-openssl-dev',
   'libncurses5-dev',
   'libgdbm-dev',
   'curl',
   'git-core',
   'make',
   'gcc',
   'g++',
   'pkg-config',
   'libfuse-dev',
   'libxml2-dev',
   'zip',
   'libtool',
   'xvfb',
   'bison',
   'libffi-dev',
   'libpng-dev',
   'openssl',
   'mysql-client',
   'mysql-server',
   'mime-support',
   'automake',
   'ruby-dev',
   'nodejs-legacy'
  ].each_with_index do |package, index|
    comment "<<-----------------#{index+1} Installing (#{package}) ------------------>>"
    command %[sudo -A apt-get install -y #{package}]
  end
  comment '---------------------------------------------------------'
  comment '-----> Installing Ruby Version Manager'
  comment '---------------------------------------------------------'
  # command %[sudo -A apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev]
  # command %[gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB]
  # command %[curl -sSL https://get.rvm.io | bash -s stable]
  # command %[source "#{fetch(:rvm_use_path)}"]
  # command %[rvm install "#{fetch(:ruby_version)}"]
  # command %[rvm use "#{fetch(:ruby_version)}" --default]
  command %[gem install bundler]

  command %[mkdir "#{fetch(:deploy_to)}"]
  command %[chown -R "#{fetch(:user)}" "#{fetch(:deploy_to)}"]
  invoke :'nginx:install'
  invoke :'nginx:setup'
  invoke :'nginx:restart'
end

task setup: :remote_environment do
  invoke :set_sudo_password
  command %[mkdir -p "#{fetch(:shared_path)}/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:shared_path)}/log"]
  command %[mkdir -p "#{fetch(:shared_path)}/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:shared_path)}/config"]
  command %[mkdir -p "#{fetch(:shared_path)}/tmp/pids"]
  command %[chmod g+rx,u+rwx "#{fetch(:shared_path)}/tmp/pids"]
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  invoke :setup_prerequisites
  invoke :setup_yml
  invoke :setup_credentials
end

task setup_yml: :remote_environment do
  Dir[File.join(__dir__, '*.yml.example')].each do |_path|
    command %[echo "#{IO.binread(_path)}" > "#{File.join(fetch(:deploy_to), 'shared/config', File.basename(_path, '.yml.example') +'.yml')}"]
  end
end

task setup_credentials: :remote_environment do
  command %[echo "#{IO.binread(File.join(__dir__, 'master.key'))}" > "#{File.join(fetch(:deploy_to), 'shared/config', 'master.key')}"]
  command "export RAILS_MASTER_KEY=#{IO.binread(File.join(__dir__,'master.key'))}"
end

task set_sudo_password: :remote_environment do
  set :sudo_password, ask_sudo
  command "echo '#{IO.binread(File.join(__dir__, 'deploy', "#{fetch(:rails_env)}_configurations_files", 'sudo_password.erb'))}' > /home/#{fetch(:user)}/SudoPass.sh"
  command "chmod +x /home/#{fetch(:user)}/SudoPass.sh"
  command "export SUDO_ASKPASS=/home/#{fetch(:user)}/SudoPass.sh"
end

desc 'Restart passenger server'
task :restart => :remote_environment do
  invoke :set_sudo_password
  invoke :'crontab:install'
  command %[sudo -A service nginx restart]
  command %[mkdir -p #{File.join(fetch(:current_path), 'tmp')}]
  command %[touch #{File.join(fetch(:current_path), 'tmp', 'restart.txt')}]

  command %[ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill]
  command %[sudo -A mkdir -p "#{fetch(:deploy_to)}/current/tmp/pids"]
  command %[sudo -A chmod g+rx,u+rwx "#{fetch(:deploy_to)}/current/tmp/pids"]
  invoke :'rvm:use', "#{fetch(:ruby_version)}@#{fetch(:gemset)}"
  command %[cd #{File.join(fetch(:current_path))} && RAILS_ENV=#{fetch(:rails_env)} bundle exec sidekiq  -C config/sidekiq.yml -d]
end

desc 'Deploys the current version to the server.'
task :deploy => :remote_environment do
  deploy do
    invoke :'check:revision'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    command %[bundle install --without development test]
    invoke :'mysql:create_database'
    invoke :'mysql:migrate_database'
    invoke :'rails:assets_precompile'
  end
  on :launch do
  end
  invoke :'deploy:cleanup'
  invoke :restart
end

# After fresh installation of mysql on server, follow steps -
#   1. sudo mysql -u root
#   2. ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new_password';
#   3. sudo service mysql stop
#   4. sudo service mysql start
#   5. Now login mysql without sudo
