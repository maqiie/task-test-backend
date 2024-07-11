Rails.application.config.action_cable.url = "ws://localhost:3000/cable"
Rails.application.config.action_cable.allowed_request_origins = [ 'http://localhost:3000', /http:\/\/localhost:3000.*/ ]

ActionCable.server.config.cable = Rails.application.config_for(:cable)
Rails.application.config.action_cable.cable = Rails.application.config_for(:cable)
