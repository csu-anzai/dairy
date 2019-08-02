namespace :mysql do
  desc 'Create a database for this application.'
  task :create_database => :remote_environment do
    command %[cd #{fetch(:current_path)}; RAILS_ENV=#{fetch(:rails_env)} bundle exec rails db:create]
  end

  task :migrate_database => :remote_environment do
    command %[cd #{fetch(:current_path)}; RAILS_ENV=#{fetch(:rails_env)} bundle exec rails db:migrate]
  end
end
