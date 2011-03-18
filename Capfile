load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

namespace :deploy do

task :start, :roles => :app do
run "mv /home/#{user}/public_html /home/#{user}/public_html.bak; ln -s #{current_path}/public /home/#{user}/public_html"

# run "rm -f #{current_path}/config/database.yml; ln -s #{deploy_to}/shared/database.yml #{current_path}/config/database.yml" # modified

run "rm -f #{current_path}/config/database.yml; ln -s /home/#{user}/rails_apps/config/database.yml #{current_path}/config/database.yml" # modified
run "rm -f #{current_path}/config/config.yml; ln -s /home/#{user}/rails_apps/config/config.yml #{current_path}/config/config.yml" # modified

run "touch #{deploy_to}/current/tmp/restart.txt"
end

task :restart, :roles => :app do

# run "rm -f #{current_path}/config/database.yml; ln -s #{deploy_to}/shared/database.yml #{current_path}/config/database.yml" # modified

run "rm -f #{current_path}/config/database.yml; ln -s /home/#{user}/rails_apps/config/database.yml #{current_path}/config/database.yml" # modified
run "rm -f #{current_path}/config/config.yml; ln -s /home/#{user}/rails_apps/config/config.yml #{current_path}/config/config.yml" # modified

run "touch #{deploy_to}/current/tmp/restart.txt"
run "ln -s #{deploy_to}/shared/avatars #{current_path}/public/images/avatars"
end

end

