class Api::V1::LocationsController < ApplicationController

	before_action :authorize_request

	def index
		@locations = Location.all
	end

end
