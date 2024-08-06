
require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DeviseTokenAuthTwitter
  class Application < Rails::Application
    config.load_defaults 5.2

    config.api_only = true

    # Session configuration
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
    config.middleware.use ActionDispatch::Flash

    # CORS configuration
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://task-test-brown.vercel.app'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end

    # Action Cable settings
    config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
    config.action_cable.allowed_request_origins = ['https://task-test-brown.vercel.app']
    config.action_cable.cable = { adapter: 'redis', url: 'redis://red-cqfu7gdds78s73c5snsg:6379/1' }

  end
end




# config/application.rb
