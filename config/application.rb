
# require_relative 'boot'

# require "rails"
# # config/application.rb
# require 'httparty'

# # Pick the frameworks you want:
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# # require "sprockets/railtie"
# # require "rails/test_unit/railtie"

# # Require the gems listed in Gemfile, including any gems
# # you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

# module DeviseTokenAuthTwitter
#   class Application < Rails::Application
#     # Initialize configuration defaults for originally generated Rails version.
#     config.load_defaults 5.2

#     # Set the timezone in config.rb
#     config.time_zone = 'Nairobi'

#     # config.time_zone = 'Africa/Nairobi' # Example timezone - replace with your desired timezone
#     config.active_job.queue_adapter = :sidekiq

#     # Settings in config/environments/* take precedence over those specified here.
#     # Application configuration can go into files in config/initializers
#     # -- all .rb files in that directory are automatically loaded after loading
#     # the framework and any gems in your application.
#     # config.middleware.use ActionDispatch::Session::CookieStore
#     # Only loads a smaller set of middleware suitable for API only apps.
#     # Middleware like session, flash, cookies can be added back manually.

#     config.generators.system_tests = nil
#     # Skip views, helpers and assets when generating a new resource.
#     config.api_only = true

#     # ここからコピペする
#     config.session_store :cookie_store, key: '_interslice_session'
#     config.middleware.use ActionDispatch::Cookies # Required for all session management
#     config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
#     config.middleware.use ActionDispatch::Flash


#     config.middleware.insert_before 0, Rack::Cors do
#       allow do
#         origins 'https://task-test-roan.vercel.app' # The exact origin of your frontend
#         resource '*',
#           headers: :any,
#           expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
#           methods: [:get, :post, :options, :delete, :put, :patch],
#           credentials: true # Include this if you are using cookies or other credentials
#       end
#     end
#     # ここまで
#   end
# end


# require_relative 'boot'

# require "rails"
# # Pick the frameworks you want:
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# # require "sprockets/railtie"
# # require "rails/test_unit/railtie"

# # Require the gems listed in Gemfile, including any gems
# # you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

# module DeviseTokenAuthTwitter
#   class Application < Rails::Application
#     # Initialize configuration defaults for originally generated Rails version.
#     config.load_defaults 5.2

#     # Settings in config/environments/* take precedence over those specified here.
#     # Application configuration can go into files in config/initializers
#     # -- all .rb files in that directory are automatically loaded after loading
#     # the framework and any gems in your application.
#     config.active_job.queue_adapter = :sidekiq

#     # Only loads a smaller set of middleware suitable for API only apps.
#     # Middleware like session, flash, cookies can be added back manually.
#     config.api_only = true

#     # Session configuration
#     config.session_store :cookie_store, key: '_interslice_session'
#     config.middleware.use ActionDispatch::Cookies # Required for all session management
#     config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
#     config.middleware.use ActionDispatch::Flash

#     # CORS configuration
#     config.middleware.insert_before 0, Rack::Cors do
#       allow do
#         origins  'https://task-test-roan.vercel.app' #, 'https://task-test-roan.vercel.app/'
#         resource '*',
#           headers: :any,
#           expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
#           methods: [:get, :post, :options, :delete, :put, :patch]
#       end
#     end
#   end
# # end
# require_relative 'boot'

# require "rails"
# # Pick the frameworks you want:
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# # require "sprockets/railtie"
# # require "rails/test_unit/railtie"

# # Require the gems listed in Gemfile, including any gems
# # you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

# module DeviseTokenAuthTwitter
#   class Application < Rails::Application
#     config.load_defaults 5.2

#     config.api_only = true

#     # Session configuration
#     config.session_store :cookie_store, key: '_interslice_session'
#     config.middleware.use ActionDispatch::Cookies
#     config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
#     config.middleware.use ActionDispatch::Flash

#     # CORS configuration
#     Rails.application.config.middleware.insert_before 0, Rack::Cors do
#       allow do
#         origins 'https://task-test-git-main-maqiies-projects.vercel.app'
    
#         resource '*',
#           headers: :any,
#           methods: [:get, :post, :put, :patch, :delete, :options, :head],
#           expose: ['access-token', 'expiry', 'token-type', 'uid', 'client']
#       end
#     end
    
#   end
# end
# config/application.rb
# config/application.rb
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
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end

    # Action Cable settings
    config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
    config.action_cable.allowed_request_origins = ['https://tasker-test.vercel.app']
    config.action_cable.cable = { adapter: 'redis', url: 'redis://red-cqfu7gdds78s73c5snsg:6379' }
  end
end
