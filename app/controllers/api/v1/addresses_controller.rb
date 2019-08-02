class Api::V1::AddressesController < ApplicationController
	
	before_action :authorize_request
	before_action :set_address, only: [:show, :edit, :update, :destroy]

	def create
    @address = Address.create(address_params)
    render json: {error: @address.errors}, status: :unprcessable_entity unless @address.valid?
	end

	def index
		@address = @current_user.addresses
	end

	def show
		@address
	end

	def update
		@address.update(address_params)
	  render json: { error: @address.errors }, status: :unprocessable_entity unless @address.valid?
	end

	def destroy
		@address.destroy
  	render json: { errors: @address.errors }, status: :unprocessable_entity unless @address
	end

	private

	def set_address
		@address = Address.find_by_id(params[:id])
	  render json: {errors: {address: 'not found'} }, status: :not_found unless @address
	end

	def address_params
		params.require(:address).permit(:id, :user_id, :location_id, :address1, :address2, :addressable_id, :addressable_type, :latitude, :longitude, :receiver_name, :receiver_mobile, :land_mark, :zip, :remarks, :status, :created_by, :updated_by  )
	end

end
