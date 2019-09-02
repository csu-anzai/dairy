class ApplicationController < ActionController::Base
  
  skip_before_action :verify_authenticity_token
  
  def not_found
    render json: { error: 'not_found' }, status: :not_found
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      # @current_user = User.where("id =? and token =?", @decoded[:user_id], header)
      # if @current_user.present?
      #   @current_user
      # else
      #   render json: { error: 'Login required!' }, status: :unauthorized
      # end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
