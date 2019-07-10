class Api::V1::AddressesController < ApplicationController

	def create
	    address = Address.create(address_params)
	    render json: address
	end

	def index
		render json: Address.all
	end

	def show
	end

	def update
		address = Address.find(params[:id])
	    address.update_attributes(address_params)
	    render json: address
	end

	def destroy
		Address.destroy(params[:id])
	end

	private

	def address_params
		params.require(:address).permit(:id, :user_id, :locality_id, :address1, :address2, :addressable_id, :addressable_type, :latitude, :longitude, :receiver_name, :receiver_mobile, :land_mark, :zip, :status  )
	end

end
