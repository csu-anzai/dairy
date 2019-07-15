class Api::V1::ItemAttributesController < ApplicationController

	before_action :set_attribute, only: [:show, :edit, :update, :destroy]

	def create
	    @item_attribute = ItemAttribute.create(item_attr_params)
	    render json: {error: @item_attribute.errors}, status: :unprcessable_entity unless @item_attribute.valid?
	end

	def index
	  @item_attribute = ItemAttribute.all
	end

	def show
		@item_attribute
	end

	def update
	    @item_attribute.update(item_attr_params)
	    render json: { error: @item_attribute.errors }, status: :unprocessable_entity unless @item_attribute.valid?
	end

	def destroy
		@item_attribute.destroy
	  	render json: { errors: @item_attribute.errors }, status: :unprocessable_entity unless @item_attribute
	end

	private

	def set_attribute
		@item_attribute = ItemAttribute.find_by_id(params[:id])
	    render json: {error: {item_attribute: 'not found'} }, status: :not_found unless @item_attribute
	end

	def item_attr_params
		params.require(:item_attribute).permit(:id, :name, :active)
	end

end
