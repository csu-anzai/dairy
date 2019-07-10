class Api::V1::RoutesController < ApplicationController

	def create
	    route = Route.create(route_params)
	    render json: route
	end

	def index
		render json: Route.all
	end

	def show
	end

	def update
		route = Route.find(params[:id])
	    route.update_attributes(route_params)
	    render json: route
	end

	def destroy
		Route.destroy(params[:id])
	end

	private

	def route_params
		params.require(:route).permit(:id, :vendor_id, :delivery_executive_id, :name, :start_point, :end_point, :latitude, :longitude, :status)
	end

end
