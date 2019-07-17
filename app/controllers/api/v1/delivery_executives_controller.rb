class Api::V1::DeliveryExecutivesController < ApplicationController

	def create
	    del_exec = DeliveryExecutive.create(del_executive_params)
	    render json: del_exec
	end

	def index
		render json: DeliveryExecutive.all
	end

	def show
	end

	def update
		del_exec = DeliveryExecutive.find(params[:id])
	    del_exec.update_attributes(del_executive_params)
	    render json: del_exec
	end

	def destroy
		DeliveryExecutive.destroy(params[:id])
	end

	private

	def del_executive_params
		params.require(:delivery_executive).permit(:id, :salutation, :name, :gender, :username, :email, :mobile, :date_of_birth, :type, :premium, :call_verified, :blacklisted, :active, :created_by, :updated_by )
	end

end
