class Api::V1::ItemCategoriesController < ApplicationController

	def create
	    item_category = ItemCategory.create(i_category_params)
	    render json: item_category
	end

	def index
		render json: ItemCategory.all
	end

	def show
	end

	def update
		item_category = ItemCategory.find(params[:id])
	    item_category.update_attributes(i_category_params)
	    render json: item_category
	end

	def destroy
		ItemCategory.destroy(params[:id])
	end

	private

	def i_category_params
		params.require(:item_category).permit(:id, :name, :active)
	end

end
