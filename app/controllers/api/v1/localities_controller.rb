class Api::V1::LocalitiesController < ApplicationController

	def create
	    locality = Locality.create(locality_params)
	    render json: locality
	end

	def index
		render json: Locality.all
	end

	def show
	end

	def update
		locality = Locality.find(params[:id])
	    locality.update_attributes(locality_params)
	    render json: locality
	end

	def destroy
		Locality.destroy(params[:id])
	end

	private

	def locality_params
		params.require(:locality).permit(:id, :route_id, :name, :description)
	end

end
