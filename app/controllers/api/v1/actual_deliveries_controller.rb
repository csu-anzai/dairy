class Api::V1::ActualDeliveriesController < ApplicationController

	before_action :authorize_request

	def index
		@deliveries = ActualDelivery.all
	end

end
