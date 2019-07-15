class Api::V1::ItemCategoriesController < ApplicationController

	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def create
	    @item_category = ItemCategory.create(i_category_params)
	    render json: { message: 'Created successfully.', item_category: @item_category }, status: :ok if @item_category.save
	    render json: {error: @item_category.errors}, status: :unprcessable_entity unless @item_category.valid?
	end

	def index
		@item_category = ItemCategory.all
    	render json: @item_category, status: :ok
	end

	def show
		render json: @item_category, status: :ok
	end

	def update
		if @item_category.update(i_category_params)
		    render json: { message: 'Update successfully.', item_category: @item_category }, status: :ok
	    else
	      render json: { error: @item_category.error }, status: :unprocessable_entity
	    end
	end

	def destroy
		if @item_category.destroy
	  		render json: {message: 'deleted successfully!'}, status: :ok
	  	else
	  		render json: { errors: @item_category.errors }, status: :unprocessable_entity
	  	end
	end

	private

	def set_category
		@item_category = ItemCategory.find_by_id(params[:id])
	    render json: {errors: {item_category: 'not found'} }, status: :not_found unless @item_category
	end

	def i_category_params
		params.require(:item_category).permit(:id, :name, :active)
	end

end
