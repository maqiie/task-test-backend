Rails.application.config.action_cable.url = "wss://task-test-backend.onrender.com/cable"
Rails.application.config.action_cable.allowed_request_origins = [ 'https://task-test-brown.vercel.app/', /http:\/\/localhost:3000.*/ ]

ActionCable.server.config.cable = Rails.application.config_for(:cable)
Rails.application.config.action_cable.cable = Rails.application.config_for(:cable)
