# config valid only for current version of Capistrano
lock '3.6.1'

set :application, "jeffreyatw"
set :repository,  "git@jeffreyatw-rails.github.com:JeffreyATW/jeffreyatw_rails.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/jeffreyatw/webapps/jeffreyatw"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log')

# Default value for default_env is {}
# Default value for default_env is {}
set :default_env, {
  PATH: "#{fetch(:deploy_to)}/gems/bin:$PATH",
  GEM_PATH: "#{fetch(:deploy_to)}/gems",
  GEM_HOME: "#{fetch(:deploy_to)}/gems"
}

set :tmp_dir, "#{fetch(:deploy_to)}/tmp"

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  desc "Restart nginx"
  task :restart do
    on roles(:app) do
      execute "#{fetch(:deploy_to)}/bin/restart"
    end
  end

  desc "Install npm modules"
  task :npm_install do
    run "cd #{current_path}; npm install"
  end
end
after :deploy, 'deploy:restart'
after :deploy, 'deploy:npm_install'

namespace :db do

  desc "Populates the Production Database"
  task :seed do
    on roles(:app) do
      puts "\n\n=== Populating the Production Database! ===\n\n"
      execute "cd #{fetch(:current_path)}; rake db:seed RAILS_ENV=production"
    end
  end

end
