class Api::V1::BatchesController < ApplicationController

	before_action :authorize_request
	
	def index
		@batches = Batch.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @batches.present?
	end

end
