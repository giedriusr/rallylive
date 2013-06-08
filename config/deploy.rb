set :repository,  "git@github.com:giedriusr/rallylive.git"
set :scm, :git
set :user, 'root'
set :deploy_via, :remote_cache
set :default_environment, {
  'LANG' => 'en_US.UTF-8'
}

set :shared_children, %w(
  public/uploads
  tmp/cache
  tmp
)

desc 'Deploy to production (production environment)'
task :production do
  set :application, 'raceonline.lt'
  set :environment, 'production'
  set :deploy_to, "/srv/www/#{application}"
  server 'rally', :app, :web, :db, :primary => true

  # set :whenever_environment, :alpha
  # set :whenever_command, "bundle exec whenever"
  # require "whenever/capistrano"
end

after 'deploy', 'deploy:bundle_install'
after 'deploy', 'deploy:update_shared_files'
after 'deploy', 'cache:fix_permissions'
after 'deploy', 'assets:precompile'
after 'deploy', 'passenger:restart'

namespace :deploy do

  desc 'Runs right after checking out the latest revision from source control'
  task :finalize_update, :except => { :no_release => true } do
    shared_children.each do |path|
      full_path = "#{release_path}/#{path}"
      run "rm -rf #{full_path}"
      parent = File.dirname(full_path)
      run "ln -s #{shared_path}/#{path} #{parent}"
    end
  end

   task :update_shared_files, :roles => :web do
    run "ln -s #{shared_path}/config/database.yml #{current_path}/config/database.yml"
    production_log = "log/production.log"
    run "ln -s #{shared_path}/#{production_log} #{current_path}/#{production_log}"
  end

  task :bundle_install, :roles => :web do
    run "cd #{current_path}; bundle install"
  end

  task :prepare_database, :roles => :db do
    run "cd #{current_path}; RAILS_ENV=#{environment} bundle exec rake db:create"
    run "cd #{current_path}; RAILS_ENV=#{environment} bundle exec rake db:migrate"
  end

  task :reset_database, :roles => :db do
    run "cd #{current_path}; RAILS_ENV=#{environment} bundle exec rake db:reset"
  end

  task :migrate, :roles => :db, :only => { :primary => true } do
    run "cd #{current_path}; RAILS_ENV=#{environment} bundle exec rake db:migrate"
  end

  task :restart do ; end
end

namespace :cache do
  desc 'Fixing permissions of /public folder to "nogroup"'
  task :fix_permissions, :roles => :app do
    run "cd #{release_path}; #{try_sudo} chgrp nogroup public/"
  end
end

namespace :passenger do
  desc "Restarting Phusion Passenger (Rails Application)"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

namespace :assets do
  desc 'Precompiling assets'
  task :precompile, :roles => :web do
    run "cd #{current_path}; RAILS_ENV=#{environment} bundle exec rake assets:precompile"
  end
end

# configuration for RVM to use bundle command via Capistrano
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system
require './config/boot'
require 'rvm/capistrano'
# require 'airbrake/capistrano'
