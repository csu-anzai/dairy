class Api::V1::DeliveriesController < ApplicationController

	before_action :authorize_request

	def index
		@deliveries = Delivery.all
	end

end
