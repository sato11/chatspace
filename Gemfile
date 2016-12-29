source 'https://rubygems.org'

# Default Gems
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'     # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'mysql2', '>= 0.3.18', '< 0.5'        # Use mysql as the database for Active Record
gem 'puma', '~> 3.0'                      # Use Puma as the app server
gem 'sass-rails', '~> 5.0'                # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                # Use Uglifier as compressor for JavaScript assets
gem 'jquery-rails'                        # Use jquery as the JavaScript library
gem 'turbolinks', '~> 5'                  # Turbolinks makes navigating your web application faster
gem 'jbuilder', '~> 2.5'                  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Front side
gem 'haml-rails'                          # Use haml for markup
gem 'erb2haml'                            # Convert .erb files to .haml
gem 'font-awesome-rails'                  # Import font-awesome library

# User sessions
gem 'devise'                              # Enable user functions

# Image library and processor
gem 'carrierwave'                         # Simple and flexible file uploader
gem 'mini_magick'                         # A ruby wrapper for ImageMagick or GraphicsMagick command line.

# AWS S3 related libraries
gem 'fog-aws'                             # Module for the 'fog' gem to support Amazon Web Services http://aws.amazon.com/
gem 'dotenv-rails'                        # Loads environment variables from `.env`.

group :development, :test do
  gem 'byebug', platform: :mri            # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'                         # Call 'binding.pry' anywhere in the code to stop execution and start console
end

group :development do
  gem 'web-console'                       # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'spring'                            # Spring speeds up development by keeping your application running in the background
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'                       # Provide for test framework
  gem 'factory_girl_rails'                # Build sample instance for rspec
  gem 'faker'                             # Generate random data as a tentative instance
end
