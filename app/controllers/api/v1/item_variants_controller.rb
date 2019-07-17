class Api::V1::ItemVariantsController < ApplicationController

	def create
	    item_variant = ItemVariant.create(item_params)
	    render json: item_variant
	end

	def index
		render json: ItemVariant.all
	end

	def show
	end

	def update
		item_variant = ItemVariant.find(params[:id])
	    item_variant.update_attributes(item_params)
	    render json: item_variant
	end

	def destroy
		ItemVariant.destroy(params[:id])
	end

	private

	def item_params
		params.require(:item_variant).permit(:id, :item_id, :price, :active, :created_by, :updated_by)
	end

end
