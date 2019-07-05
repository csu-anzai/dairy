class Api::V1::DeliveriesController < ApplicationController

	def create
	    delivery = Delivery.create(delivery_params)
	    render json: delivery
	end

	def index
		render json: Delivery.all
	end

	def show
	end

	def update
		delivery = Delivery.find(params[:id])
	    delivery.update_attributes(delivery_params)
	    render json: delivery
	end

	def destroy
		Delivery.destroy(params[:id])
	end

	private

	def delivery_params
		params.require(:delivery).permit(:id, :name)
	end

end
