class Api::V1::DeliveryExecutivesController < ApplicationController

	before_action :authorize_request

	def index
		@d_executives = DeliveryExecutive.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @d_executives.present?
	end

end
