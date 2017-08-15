require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chatspace
  class Application < Rails::Application
    config.assets.paths << Rails.root.join('public', 'assets', 'stylesheets')
    config.assets.paths << Rails.root.join('public', 'assets', 'javascripts')
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
    end
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
  end
end
