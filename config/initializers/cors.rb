Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://task-test-roan.vercel.app' # Your frontend origin
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end
  