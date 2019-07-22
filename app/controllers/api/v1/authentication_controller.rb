class Api::V1::AuthenticationController < ApplicationController

	before_action :authorize_request, except: :login

  def login
    @user = User.find_by_email(params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      @token = JsonWebToken.encode(user_id: @user.id)
      @time = Time.now + 24.hours.to_i
      @user.update(token: @token)
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def logout
    if @current_user
      @current_user.update(token: '')
    else
      render json: { error: "Cann't logout!" }, status: :unprcessable_entity
    end
  end

  def change_password

    if @current_user.authenticate(params[:old_password].strip)
      password = params[:password].strip
      password_confirm = params[:password_confirmation].strip
      
      if password == password_confirm
        @current_user.update(password: password, password_confirmation: password_confirm)
      else
        render json: { error: "Password mismatched!" }, status: :unprcessable_entity
      end
    else
      render json: { error: "Old password mismatched!" }, status: :unprcessable_entity
    end
    
  end

  private

  def login_params
    params.permit(:email, :password)
  end
  
end
