class Api::V1::AddonsController < ApplicationController

	before_action :authorize_request
	before_action :set_add_on, only: [:show, :edit, :update, :destroy]
	
	def create
	    @add_on = Addon.create(addon_params)
	    render json: {error: @add_on.errors}, status: :unprcessable_entity unless @add_on.valid?
	end

	def index
		@add_ons = @current_user.addons
	end

	def show
		@add_on
	end

	def update
		@add_on.update(addon_params)
	    render json: { error: @add_on.error }, status: :unprocessable_entity unless @add_on.valid?
	end

	def destroy
		@add_on.destroy
  		render json: { errors: @add_on.errors }, status: :unprocessable_entity unless @add_on
	end

	private

	def set_add_on
		@add_on = Addon.find_by_id(params[:id])
	    render json: {errors: {add_on: 'not found'} }, status: :not_found unless @add_on
	end

	def addon_params
		params.require(:addon).permit(:id, :subscription_id, :title, :quantity, :unit_id, :start_date, :end_date, :remarks, :status, :created_by, :updated_by )
	end

end
