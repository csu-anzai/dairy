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
		params.require(:addon).permit(:id, :subscription_id, :title, :quantity, :unit_id, :start_date, :end_date, :remarks, :status, :created_by, :updated_by )
	end

end
