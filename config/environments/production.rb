

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

#   # Enable locale fallbacks for I18n.
#   config.i18n.fallbacks = true

#   # Do not log deprecations.
#   config.active_support.report_deprecations = false

#  # Action Cable settings
#  config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
#  config.action_cable.allowed_request_origins = ['https://task-test-backend.onrender.com', 'https://task-test-brown.vercel.app']

#  # Configure Action Cable with Redis
#  config.action_cable.adapter = :redis
#  config.action_cable.redis = { url: 'redis://red-cqfu7gdds78s73c5snsg:6379' }
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

#   # Enable locale fallbacks for I18n.
#   config.i18n.fallbacks = true

#   # Do not log deprecations.
#   config.active_support.report_deprecations = false

#   # Action Cable settings
#   config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
#   config.action_cable.allowed_request_origins = ['https://task-test-backend.onrender.com', 'https://tasker-test.vercel.app']

#   # Configure Action Cable with Redis
#   config.action_cable.adapter = :redis
#   config.action_cable.redis = { url: 'redis://red-cqfu7gdds78s73c5snsg:6379', channel_prefix: 'your_app_production' }

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
# Rails.application.configure do
#   # Code is not reloaded between requests.
#   config.cache_classes = true
#   config.eager_load = true
#   config.consider_all_requests_local = false

#   # Enable/disable caching.
#   config.action_controller.perform_caching = true
#   config.cache_store = :memory_store
#   config.public_file_server.headers = {
#     'Cache-Control' => "public, max-age=#{2.days.to_i}"
#   }

#   # Store uploaded files on the local file system (see config/storage.yml for options).
#   config.active_storage.service = :local

#   # Don't force SSL in production.
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

#   # Enable locale fallbacks for I18n.
#   config.i18n.fallbacks = true

#   # Do not log deprecations.
#   config.active_support.report_deprecations = false

#   # Action Cable settings
#   config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
#   config.action_cable.allowed_request_origins = ['https://task-test-brown.vercel.app/', 'https://task-test-backend.onrender.com']
 
#   # Configure Action Mailer.
#   config.action_mailer.delivery_method = :smtp
#   config.action_mailer.smtp_settings = {
#     address:              'smtp.gmail.com',
#     port:                 587,
#     domain:               'email.com',
#     user_name:            ENV['GMAIL_USERNAME'],
#     password:             ENV['GMAIL_PASSWORD'],
#     authentication:       'plain',
#     enable_starttls_auto: true
#   }
# end

Rails.application.configure do
  # Code is not reloaded between requests.
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false

  # Enable/disable caching.
  config.action_controller.perform_caching = true
  config.cache_store = :memory_store
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Force SSL in production.
  config.force_ssl = true

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
  config.action_cable.allowed_request_origins = ['https://task-test-brown.vercel.app/']
  
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'email.com',
    user_name:            ENV['GMAIL_USERNAME'],
    password:             ENV['GMAIL_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true
  }
end
