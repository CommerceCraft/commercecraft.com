set :application, "commercecraft.com"
set :repository,  "git@github.com:mrbanzai/commercecraft.com"
set :deploy_to, "/srv/#{application}"
set :user, "michael"
set :ssh_options, { :forward_agent => true }

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "commercecraft.com"                          # Your HTTP server, Apache/etc
role :app, "commercecraft.com"                          # This may be the same as your `Web` server
role :db,  "commercecraft.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end