set :stages, %w(production)
set :default_stage, "production"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'


role (:web) {"#{domain}"}
role (:app) {"#{domain}"}
role (:db) { ["#{domain}", {:primary => true}] }

# Set the deploy branch to the current branch
set :application, "hiperpoolnew"
set :scm, :git
set (:repository) { "#{gitrepo}" }
set (:deploy_to) { "#{deploydir}" }
#set :scm_user, "ubuntu"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

desc "Symlinks database.yml, mailer.yml file from shared directory into the latest release"
task :symlink_shared, :roles => [:app, :db] do
  run "ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
#  run "ln -s #{shared_path}/system #{latest_release}/system"
#  run "ln -s #{shared_path}/public/system/attaches #{latest_release}/public/system/attaches"
end


# after "deploy:stop",    "delayed_job:stop"
# after "deploy:start",   "delayed_job:start"
# after "deploy:restart", "delayed_job:restart"
# 

#task :restart_delayed_job, :roles => [:app, :db] do
#  run "RAILS_ENV=serverdev script/delayed_job stop"
#  run "RAILS_ENV=serverdev script/delayed_job start"
#end
#
#after 'deploy:finalize_update', :restart_delayed_job


after 'deploy:finalize_update', :symlink_shared, "deploy:migrate"
#after 'deploy:finalize_update', 'deploy:extractions'

#namespace :deploy do
#  desc "Reload the database with seed data"
#  task :seed do
#    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
#  end
#end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end