# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://task-test-roan.vercel.app'
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
        max_age: 600
    end
  end
  