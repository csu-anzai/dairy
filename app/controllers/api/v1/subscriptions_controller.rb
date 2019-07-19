class Api::V1::SubscriptionsController < ApplicationController

	before_action :set_subscription, only: [:show, :edit, :update, :destroy]

	def create
	    @subscription = Subscription.create(subscription_params)
	    render json: {error: @subscription.errors}, status: :unprcessable_entity unless @subscription.valid?
	end

	def index
		@subscriptions = Subscription.all
	end

	def show
		@subscription
	end

	def update
	    @subscription.update(subscription_params)
	    render json: { error: @subscription.error }, status: :unprocessable_entity unless @subscription.valid?
	end

	def destroy
		@subscription.destroy
  		render json: { errors: @subscription.errors }, status: :unprocessable_entity unless @subscription
	end

	private

	def set_subscription
		@subscription = Subscription.find_by_id(params[:id])
	    render json: {errors: {subscription: 'not found'} }, status: :not_found unless @subscription
	end

	def subscription_params
		params.require(:subscription).permit(:id, :address_id, :item_variant_id, :unit_id, :title, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by)
	end

end
