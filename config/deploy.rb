default_run_options[:pty] = true
set :repository, "git@github.com:klebershimabuku/job_board.git"
set :scm, "git"
set :scm_user, "klebershimabuku"
set :user, "tenshi"
set :domain, "shigotodoko.com"
set :application, "shigotodoko"
set :password, "pqlamz09085166027"
set :use_sudo, false
set :deploy_via, :checkout
set :deploy_to, "/home/#{user}/rails_apps/production/"
set :chmod755, "app config db lib public vendor script script/* public/disp*"

set :scm_username, user
set :runner, user
set :branch, "master"
set :git_shallow_clone, 1

set :keep_releases, 5

role :app, domain
role :web, domain
role :db,  domain, :primary => true

