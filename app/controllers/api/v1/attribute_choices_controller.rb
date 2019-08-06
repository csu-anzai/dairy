class Api::V1::AttributeChoicesController < ApplicationController

	before_action :authorize_request

	def index
		@attribute_choices = AttributeChoice.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @attribute_choices.present?
	end

end
