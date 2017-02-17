namespace :unicorn do
  # Tasks
  desc 'Start unicorn'
  task(:start) {
    config = rails_root + 'config/unicorn.rb'
    sh "bundle exec unicorn_rails -c #{config} -E production"
  }

  desc 'Stop unicorn'
  task(:stop) { unicorn_signal :QUIT }

  desc 'Restart unicorn with USR2'
  task(:restart) { unicorn_signal :USR2 }

  # Helpers
  def unicorn_signal(signal)
    Process.kill signal, unicorn_pid
  end

  def unicorn_pid
    begin
      File.read('/var/www/rails-capistrano-test/current/tmp/pids/unicorn.pid').to_i
    rescue Errno::ENOENT
      raise "Unicorn doesn't seem to be running"
    end
  end

  def rails_root
    require 'pathname'
    Pathname.new(__FILE__) + '../../..'
  end
end
