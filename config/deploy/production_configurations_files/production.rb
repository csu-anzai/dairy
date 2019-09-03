# Instance Details
# set :host_ip, '3.17.189.139'
set :host_ip, '3.19.120.19'
set :domain, fetch(:host_ip)

# Rails Environment
set :rails_env, 'production'
set :ssl_enabled, false
