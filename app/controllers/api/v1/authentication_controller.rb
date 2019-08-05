class Api::V1::AuthenticationController < ApplicationController

	before_action :authorize_request, except: [:login, :forgot_password, :reset_password]
  before_action :set_user, only: [:login, :forgot_password]

  def login
    # @user = User.find_by_email(params[:auth][:email])
    if @user&.authenticate(params[:auth][:password])
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
    if @current_user.authenticate(params[:auth][:old_password].strip)
      match_password(params[:auth][:password].strip, params[:auth][:password_confirmation].strip)
    else
      render json: { error: "Old password mismatched!" }, status: :unprcessable_entity
    end
    
  end

  def reset_password
      
    if params[:auth][:otp].size == 6
      if params[:auth][:otp] == params[:auth][:otp].upcase # OTP must be in uper case.
        @current_user = User.find_by(otp: params[:auth][:otp])
        if @current_user
          if (Time.current - @current_user.otp_sent_at <= 900 ) # token expire after 15 minutes.
            if @current_user.otp == params[:auth][:otp]
              match_password(params[:auth][:password].strip, params[:auth][:password_confirmation].strip)
            else
              render json: { error: "OTP mismatched."}, status: :unprcessable_entity
            end
          else
              render json: { error: "OTP expired."}, status: :unprcessable_entity
          end
        else
          render json: {error: "Unauthorize user."}, status: :unauthorized
        end
      else
        render json: { error: "OTP is case sensitive."}, status: :unprcessable_entity
      end
    else
      render json: { error: "Invalid OTP."}, status: :unprcessable_entity
    end

  end

  def forgot_password
    if @user
      @user.update(otp: otp_generator, otp_sent_at: Time.current)
      # mail to user.email
      # sms otp to user.mobile
    else
      render json: { error: "Invalid username" }, status: :unprcessable_entity
    end
  end

  private

  def match_password(password, password_confirm)
    if password == password_confirm
      @current_user.update(password: password, password_confirmation: password_confirm)
    else
      render json: { error: "Password mismatched!" }, status: :unprcessable_entity
    end

  end

  def set_user
    user_name = params[:auth][:username].strip
    @user = User.find_by("username = ? or email = ? or mobile = ?", user_name, user_name, user_name)
  end

  def otp_generator
    characters = ('G'..'S').to_a + (0..9).to_a
    characters.to_a.shuffle.first(6).join
  end

  def login_params
    params.permit(:email, :password)
  end
  
end
