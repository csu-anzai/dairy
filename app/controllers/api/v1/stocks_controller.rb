class Api::V1::StocksController < ApplicationController

	before_action :authorize_request

	def index
		@stocks = Stock.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @stocks.present?
	end
	
end
