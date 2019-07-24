class Api::V1::ItemCategoriesController < ApplicationController

	before_action :authorize_request
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def create
	    @item_category = ItemCategory.create(i_category_params)
	    render json: {error: @item_category.errors}, status: :unprcessable_entity unless @item_category.valid?
	end

	def index
		@item_category = ItemCategory.all
	end

	def show
		@item_category
	end

	def update
		@item_category.update(i_category_params)
	    render json: { error: @item_category.error }, status: :unprocessable_entity unless @item_category.valid?
	end

	def destroy
		@item_category.destroy
  		render json: { errors: @item_category.errors }, status: :unprocessable_entity unless @item_category
	end

	private

	def set_category
		@item_category = ItemCategory.find_by_id(params[:id])
	    render json: {errors: {item_category: 'not found'} }, status: :not_found unless @item_category
	end

	def i_category_params
		params.require(:item_category).permit(:id, :name, :active, :created_by, :updated_by)
	end

end
