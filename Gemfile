source 'https://rubygems.org'

# Rails
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Database
gem 'mysql2', '>= 0.3.18', '< 0.5'

# Default Gems
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'

# Front side
gem 'erb2haml'
gem 'font-awesome-rails'
gem 'haml-rails'

# User sessions
gem 'devise'

# Image library and processor
gem 'carrierwave'
gem 'mini_magick'

# AWS S3 related libraries
gem 'dotenv-rails'
gem 'fog-aws'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rails-controller-testing'

  # capistrano
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :production do
  gem 'unicorn'
end
