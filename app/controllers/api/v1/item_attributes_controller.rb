class Api::V1::ItemAttributesController < ApplicationController

	def create
	    item_attribute = ItemAttribute.create(item_attr_params)
	    render json: item_attribute
	end

	def index
		render json: ItemAttribute.all
	end

	def show
	end

	def update
		item_attribute = ItemAttribute.find(params[:id])
	    item_attribute.update_attributes(item_attr_params)
	    render json: item_attribute
	end

	def destroy
		ItemAttribute.destroy(params[:id])
	end

	private

	def item_attr_params
		params.require(:item_attribute).permit(:id, :name, :active)
	end

end
