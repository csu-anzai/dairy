class Api::V1::SubscriptionsController < ApplicationController

	def create
	    subscription = Subscription.create(subscription_params)
	    render json: subscription
	end

	def index
		render json: Subscription.all
	end

	def show
	end

	def update
		subscription = Subscription.find(params[:id])
	    subscription.update_attributes(subscription_params)
	    render json: subscription
	end

	def destroy
		Subscription.destroy(params[:id])
	end

	private

	def subscription_params
		params.require(:subscription).permit(:id, :address_id, :item_variant_id, :unit_id, :title, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by)
	end

end
