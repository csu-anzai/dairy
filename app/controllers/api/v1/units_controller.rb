class Api::V1::UnitsController < ApplicationController

	before_action :authorize_request

	def index
		@units = Unit.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @units.present?
	end

end
