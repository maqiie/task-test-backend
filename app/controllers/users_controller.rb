class UsersController < ApplicationController
  def search
    if params[:email].present?
      @users = User.where("email LIKE ?", "%#{params[:email]}%")
    else
      @users = User.none
    end

    render json: @users
  end
end
