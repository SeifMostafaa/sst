require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sst
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    I18n.load_path += Dir["#{config.root}/app/assets/config/locales/*.yml"]
    I18n.available_locales = %i[en ar]
    I18n.default_locale = :ar
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Cairo'
    # config.eager_load_paths << Rails.root.join("extras")
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post put delete]
      end
    end
  end
end
