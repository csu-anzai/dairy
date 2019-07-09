class Api::V1::ItemsController < ApplicationController

	def create
	    item = Item.create(item_params)
	    render json: item
	end

	def index
		render json: Item.all
	end

	def show
	end

	def update
		item = Item.find(params[:id])
	    item.update_attributes(item_params)
	    render json: item
	end

	def destroy
		Item.destroy(params[:id])
	end

	private

	def item_params
		params.require(:item).permit(:id, :item_category_id, :name, :active)
	end

end
