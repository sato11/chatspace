# config valid only for current version of Capistrano
lock "3.7.1"

set :application, 'rails-capistrano-test'
set :repo_url, 'git@github.com:sato11/chatspace.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'node_modules')

set :branch, ENV['BRANCH'] if ENV['BRANCH']

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/sato11/.ssh/chatspace.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

set :npm_flags, '--silent --no-progress'

namespace :npm do
  desc 'Install Bower packages and build javascript with Gulp'
  task :build do
    on roles fetch(:npm_roles) do
      within release_path do
        execute :npm, :run, 'build'
      end
    end
  end
  after 'npm:install', 'npm:build'
end

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
