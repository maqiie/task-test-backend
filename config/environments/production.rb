
# require "active_support/core_ext/integer/time"

# Rails.application.configure do
#   # Settings specified here will take precedence over those in config/application.rb.

#   # Code is not reloaded between requests.
#   config.cache_classes = true
#   config.eager_load = true
#   config.consider_all_requests_local = false
#   config.action_controller.perform_caching = true

#   # Ensure the public file server is enabled.
#   config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

#   # Do not fallback to assets pipeline if a precompiled asset is missed.
#   config.assets.compile = false

#   # Store uploaded files on the local file system (see config/storage.yml for options).
#   config.active_storage.service = :local

#   # Do not force SSL in production.
#   config.force_ssl = false

#   # Set the logging level.
#   config.log_level = :info
#   config.log_tags = [:request_id]

#   # Use default logging formatter.
#   config.log_formatter = ::Logger::Formatter.new

#   # Log to STDOUT if specified.
#   if ENV['RAILS_LOG_TO_STDOUT'].present?
#     logger = ActiveSupport::Logger.new(STDOUT)
#     logger.formatter = config.log_formatter
#     config.logger = ActiveSupport::TaggedLogging.new(logger)
#   end

#   # Do not dump schema after migrations.
#   config.active_record.dump_schema_after_migration = false

#   config.action_cable.allowed_request_origins = ['https://tasker-test.vercel.app']

#   # Enable locale fallbacks for I18n.
#   config.i18n.fallbacks = true

#   # Do not log deprecations.
#   config.active_support.report_deprecations = false

#   # Action Cable settings
#   config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
#   Rails.application.config.action_cable.allowed_request_origins = ['https://tasker-test.vercel.app']
#   config.action_cable.allowed_request_origins = ['https://tasker-test.vercel.app', 'http://localhost:3000']
#   config.action_cable.cable = Rails.application.config_for(:cable)

#   # Configure Action Mailer.
#   config.action_mailer.delivery_method = :smtp
#   config.action_mailer.smtp_settings = {
#     address:              'smtp.gmail.com',
#     port:                 587,
#     domain:               'example.com',
#     user_name:            ENV['GMAIL_USERNAME'],
#     password:             ENV['GMAIL_PASSWORD'],
#     authentication:       'plain',
#     enable_starttls_auto: true
#   }
# end
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensure the public file server is enabled.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Do not force SSL in production.
  config.force_ssl = false

  # Set the logging level.
  config.log_level = :info
  config.log_tags = [:request_id]

  # Use default logging formatter.
  config.log_formatter = ::Logger::Formatter.new

  # Log to STDOUT if specified.
  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Do not log deprecations.
  config.active_support.report_deprecations = false

  # Action Cable settings
  config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
  config.action_cable.allowed_request_origins = ['https://task-test-backend.onrender.com', 'https://tasker-test.vercel.app','*']
  config.action_cable.cable = { adapter: 'redis', url: 'redis://red-cqfu7gdds78s73c5snsg:6379' }

  # Configure Action Mailer.
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'example.com',
    user_name:            ENV['GMAIL_USERNAME'],
    password:             ENV['GMAIL_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true
  }
end


