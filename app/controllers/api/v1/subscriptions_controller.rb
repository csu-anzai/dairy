class Api::V1::SubscriptionsController < ApplicationController

	before_action :authorize_request
	before_action :set_subscription, only: [:show, :edit, :update, :destroy]

	def create
    @subscription = Subscription.create(subscription_params)
    render json: {access_code: I18n.t('access_code.failure'), error: @subscription.errors}, status: :unprcessable_entity unless @subscription.valid?
	end

	def index
		@subscriptions = @current_user.subscriptions
	end

	def show
		@subscription
	end

	def update
    @subscription.update(subscription_params)
    render json: {access_code: I18n.t('access_code.failure'), error: @subscription.errors }, status: :unprocessable_entity unless @subscription.valid?
	end

	def destroy
		@subscription.destroy
  	render json: {access_code: I18n.t('access_code.failure'), errors: @subscription.errors }, status: :unprocessable_entity unless @subscription
	end

	private

	def set_subscription
		@subscription = Subscription.find_by_id(params[:id])
	  render json: {access_code: I18n.t('access_code.failure'), errors: { subscription: I18n.t('api.model.not_found') } }, status: :not_found unless @subscription
	end

	def subscription_params
		params.require(:subscription).permit(:id, :address_id, :item_variant_id, :unit_id, :title, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by)
	end

end
