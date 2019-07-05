class Api::V1::AddonsController < ApplicationController

	def create
	    addon = Addon.create(addon_params)
	    render json: addon
	end

	def index
		render json: Addon.all
	end

	def show
	end

	def update
		addon = Addon.find(params[:id])
	    addon.update_attributes(addon_params)
	    render json: addon
	end

	def destroy
		Addon.destroy(params[:id])
	end

	private

	def addon_params
		params.require(:addon).permit(:id, :name)
	end

end
