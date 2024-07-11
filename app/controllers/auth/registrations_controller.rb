
class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    super do |user|
      user.update(role: User.first.nil? ? 'admin' : 'user')
    end
  end

  def update
    @resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = @resource.unconfirmed_email if @resource.respond_to?(:unconfirmed_email)

    if @resource.update(account_update_params)
      yield @resource if block_given?

      if is_flashing_format?
        set_flash_message :notice, :updated
      end

      # Handle image attachment update
      if params[:user][:image].present?
        Rails.logger.info("Image param received: #{params[:user][:image]}")
        @resource.image.attach(params[:user][:image])
        Rails.logger.info("Image attached: #{@resource.image.attached?}")
      else
        Rails.logger.info("No image param received.")
      end

      if @resource.respond_to?(:unconfirmed_email?) && prev_unconfirmed_email != @resource.unconfirmed_email
        flash_key = :update_needs_confirmation
      end

      # Respond with updated resource and tokens
      render json: {
        status: 'success',
        data: @resource,
        message: 'Profile updated successfully'
      }, status: :ok
    else
      Rails.logger.error("Update failed: #{@resource.errors.full_messages.join(', ')}")
      clean_up_passwords @resource
      set_minimum_password_length

      render json: { error: @resource.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  rescue => e
    Rails.logger.error("Update failed with error: #{e.message}")
    render json: { error: "Update failed: #{e.message}" }, status: :unprocessable_entity
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :nickname, :birthday, :role, :uid, :image)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :nickname, :birthday, :role, :uid, :image])
  end

  def after_update_path_for(resource)
    root_path
  end
end
