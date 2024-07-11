
# app/controllers/auth/sessions_controller.rb
class Auth::SessionsController < DeviseTokenAuth::SessionsController
    respond_to :json
  
    def create
      super do |user|
        cookies.signed[:user_id] = { value: user.id, expires: 2.hours }
      end
    end
  
    def destroy
      super do
        cookies.delete(:user_id)
      end
    end
  
    private
  
    def respond_with(resource, _opts = {})
      render json: {
        status: { code: 200, message: 'Logged in successfully.' },
        data: resource.as_json
      }, status: :ok
    end
  
    def respond_to_on_destroy
      head :no_content
    end
  end
  