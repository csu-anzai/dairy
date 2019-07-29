class Api::V1::UnitsController < ApplicationController

	before_action :authorize_request

	def index
		@units = Unit.all
	end

end
