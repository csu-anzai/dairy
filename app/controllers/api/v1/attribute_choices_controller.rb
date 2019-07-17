class Api::V1::AttributeChoicesController < ApplicationController

	def create
	    attribute_choice = AttributeChoice.create(attr_choice_params)
	    render json: attribute_choice
	end

	def index
		render json: AttributeChoice.all
	end

	def show
	end

	def update
		attribute_choice = AttributeChoice.find(params[:id])
	    attribute_choice.update_attributes(attr_choice_params)
	    render json: attribute_choice
	end

	def destroy
		AttributeChoice.destroy(params[:id])
	end

	private

	def attr_choice_params
		params.require(:attribute_choice).permit(:id, :item_attribute_id,  :name, :active, :created_by, :updated_by)
	end

end
