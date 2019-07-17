class Api::V1::VendorsController < ApplicationController

	def create
	    vendor = Vendor.create(vendor_params)
	    render json: vendor
	end

	def index
		render json: Vendor.all
	end

	def show
	end

	def update
		vendor = Vendor.find(params[:id])
	    vendor.update_attributes(vendor_params)
	    render json: vendor
	end

	def destroy
		Vendor.destroy(params[:id])
	end

	private

	def vendor_params
		params.require(:vendor).permit(:id, :salutation, :name, :gender, :username, :email, :mobile, :date_of_birth, :type, :premium, :call_verified, :blacklisted, :active, :created_by, :updated_by )
	end

end
