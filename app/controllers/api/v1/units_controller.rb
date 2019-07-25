class Api::V1::UnitsController < ApplicationController

	before_action :authorize_request
	
	def create
    unit = Unit.create(attr_choice_params)
    render json: unit
	end

	def index
		render json: Unit.all
	end

	def show
	end

	def update
		unit = Unit.find(params[:id])
    unit.update_attributes(attr_choice_params)
    render json: unit
	end

	def destroy
		Unit.destroy(params[:id])
	end

	private

	def attr_choice_params
		params.require(:unit).permit(:id, :name, :code, :active, :created_by, :updated_by)
	end

end
