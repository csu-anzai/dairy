class Api::V1::LocationsController < ApplicationController

	before_action :authorize_request

	def index
		@locations = Location.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @locations.present?
	end

end
