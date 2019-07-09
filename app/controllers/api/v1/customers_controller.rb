class Api::V1::CustomersController < ApplicationController

	def create
	    customer = Customer.create(customer_params)
	    render json: customer
	end

	def index
		render json: Customer.all
	end

	def show
	end

	def update
		customer = Customer.find(params[:id])
	    customer.update_attributes(customer_params)
	    render json: customer
	end

	def destroy
		Customer.destroy(params[:id])
	end

	private

	def customer_params
		params.require(:customer).permit(:id, :salutation, :name, :gender, :username, :email, :mobile, :date_of_birth, :type, :premium, :call_verified, :blacklisted, :active )
	end

end
