class Api::V1::ItemCategoriesController < ApplicationController

	before_action :authorize_request
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def create
    @item_category = ItemCategory.create(i_category_params)
    render json: {access_code: I18n.t('access_code.failure'), error: @item_category.errors}, status: :unprcessable_entity unless @item_category.valid?
	end

	def index
		@item_categories = ItemCategory.all
	end

	def show
		@item_category
	end

	def update
		@item_category.update(i_category_params)
	  render json: {access_code: I18n.t('access_code.failure'), error: @item_category.errors }, status: :unprocessable_entity unless @item_category.valid?
	end

	def destroy
		@item_category.destroy
  	render json: {access_code: I18n.t('access_code.failure'), errors: @item_category.errors }, status: :unprocessable_entity unless @item_category
	end

	private

	def set_category
		@item_category = ItemCategory.find_by_id(params[:id])
	  render json: {access_code: I18n.t('access_code.failure'), errors: { item_category: I18n.t('api.model.not_found') } }, status: :not_found unless @item_category
	end

	def i_category_params
		params.require(:item_category).permit(:id, :name, :active, :created_by, :updated_by)
	end

end
