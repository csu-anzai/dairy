class Api::V1::ActualDeliveriesController < ApplicationController

	before_action :authorize_request

	def index
		@deliveries = ActualDelivery.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @deliveries.present?
	end

end
