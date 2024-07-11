Rails.application.config.middleware.use Warden::Manager do |manager|
    # Tell Warden how to serialize the user in the session
    manager.serialize_into_session { |user| user.to_json }
  
    # Tell Warden how to deserialize the user from the session
    manager.serialize_from_session { |serialized_user| User.new(JSON.parse(serialized_user)) }
  
    # Configure strategies here
    manager.default_strategies(:api_token)  # Replace :api_token with your strategy name if different
  
    # Setup the failure app to respond with JSON
    manager.failure_app = ->(env) { ApplicationController.action(:render_unauthorized).call(env) }
  
    # If you want to use a custom scope, you can define it here
    # manager.scope_defaults :api_token, strategies: [:your_custom_strategy], store: false
  end
  