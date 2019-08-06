class Api::V1::UsersController < ApplicationController
    
    before_action :authorize_request, except: %i[create]
    before_action :find_user, except: %i[create index]

	def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: {access_code: I18n.t('access_code.failure'), errors: @user.errors.full_messages },status: :unprocessable_entity
    end
	end

	def index
		@users = User.all
	end

	def show
		render json: @user, status: :ok
	end

	def update
		unless @user.update(user_params)
	    render json: {access_code: I18n.t('access_code.failure'), errors: @user.errors.full_messages }, status: :unprocessable_entity
	  end
	end

	def destroy
		@user.destroy
	end

	private

	def find_user
    @user = User.find_by_username!(params[:_username])
	  rescue ActiveRecord::RecordNotFound
    render json: {access_code: I18n.t('access_code.failure'), errors: I18n.t('model.not_found') }, status: :not_found
	end

	def user_params
		params.require(:user).permit(:id, :salutation, :name, :gender, :username, :email, :mobile, :date_of_birth, :type, :premier, :call_verified, :blacklisted, :active, :created_by, :updated_by )
	end

end
