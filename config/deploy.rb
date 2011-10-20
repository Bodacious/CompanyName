# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) 

# Load RVM's capistrano plugin.
require "rvm/capistrano"                  
require 'capistrano/ext/multistage'

set :application, "CompanyName"
set :repository,  "git@github.com:Bodacious/CompanyName.git"

# deploy settings
set :user, "gavin"
set :deploy_to, lambda {"/home/#{user}/#{application}/#{rails_env}"}
set :use_sudo, false
set :run_method, :run

# Git settings
set :scm, "git"
set :scm_user, "gavinM"
set :branch, "master"

# RVM Settings
set :rvm_ruby_string, "ruby-1.9.2-p180@#{application}"
set :rvm_type, :user  

# only keep 3 previous releases on server
set :keep_releases, 3

# SSH settings
ssh_options[:port]     = 9021 
default_run_options[:pty] = true

role :web, "178.79.136.234"                          # Your HTTP server, Apache/etc
role :app, "178.79.136.234"                          # This may be the same as your `Web` server
role :db,  "178.79.136.234", :primary => true        # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app do
    run " touch #{File.join(current_path,'tmp','restart.txt')}"
  end
    
end


namespace :bundle do

  desc "run bundle install"
  task :install do
    run "cd #{current_release} && bundle install --without test development"
  end

end
 
namespace :tail do

  desc "Tail the current environment's log file"
  task :log, :roles => :app do
    stream "tail -f #{shared_path}/log/#{rails_env}.log"  
  end

end

namespace :web do
  
  desc "Serve up a maintenance page"
  task :disable, :roles => :web do 
    on_rollback {run "rm #{shared_path}/system/maintenance.html"}
    
    page = File.read("#{current_path}/public/notice/maintenance.html")
    put page, "#{shared_path}/system/maintenance.html", :mode => 0644
  end
  
end

namespace :assets do
  
  desc "precompile assets to assets dir in public/"
  task :precompile do
    run "cd #{current_path} && rake assets:precompile RAILS_ENV=#{rails_env}"
  end
  
end

before "deploy:restart", "bundle:install", "assets:precompile"
# after "deploy:restart", "deploy:cleanup", "thinking_sphinx:rebuild", "whenever:update_crontab"
after "deploy:restart", "deploy:cleanup", "whenever:update_crontab"