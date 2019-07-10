class Api::V1::UsersController < ApplicationController

	def create
	    user = User.create(user_params)
	    render json: user
	end

	def index
		render json: User.all
	end

	def show
	end

	def update
		user = User.find(params[:id])
	    user.update_attributes(user_params)
	    render json: user
	end

	def destroy
		User.destroy(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:id, :salutation, :name, :gender, :username, :email, :mobile, :date_of_birth, :type, :premium, :call_verified, :blacklisted, :active )
	end

end
