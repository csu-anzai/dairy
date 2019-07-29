class Api::V1::DeliveryExecutivesController < ApplicationController

	before_action :authorize_request

	def index
		@d_executives = DeliveryExecutive.all
	end

end
