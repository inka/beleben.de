set :application, "beleben"
set :domain, "beleben.de"
set :deploy_to, "/var/www/test.#{domain}"
#set :user, "deployer" # default ist der aktuelle User
set :use_sudo, false # Verwende kein sudo

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :subversion
set :repository,  "https://svn.codespaces.com/stadtmuster/svn/beleben.de/trunk"
set :scm_username, "inka"
set :scm_password, "urtcsop."

role :app, "test.beleben.de"
role :web, "test.beleben.de"
role :db,  "test.beleben.de", :primary => true

# from http://www.modrails.com/documentation/Users%20guide.html#capistrano
namespace :deploy do
  desc "Create asset packages for production"
  task :after_update_code, :roles => [:web] do
    run <<-EOF
      cd #{release_path} && rake RAILS_ENV=production asset:packager:build_all
    EOF
  end
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end