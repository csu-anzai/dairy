class Api::V1::PaymentsController < ApplicationController
	
	before_action :authorize_request

	def payment_history
		subs_id = params[:payment][:subscription_id]
		@payments = @current_user.subscriptions.find(subs_id).payments
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @payments.present?
	end

	def due_payment
		@payment = @current_user.to_be_paid_amount
	end

end
