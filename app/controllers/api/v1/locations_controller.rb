class Api::V1::LocationsController < ApplicationController

	def create
	    location = Location.create(location_params)
	    render json: location
	end

	def index
		render json: Location.all
	end

	def show
	end

	def update
		location = Location.find(params[:id])
	    location.update_attributes(location_params)
	    render json: location
	end

	def destroy
		Location.destroy(params[:id])
	end

	private

	def location_params
		params.require(:location).permit(:id, :vendor, :delivery_executive, :name, :start_point, :end_point, :latitude, :longitude, :status, :description)
	end

end
