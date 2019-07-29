class Api::V1::StocksController < ApplicationController

	before_action :authorize_request

	def index
		@stocks = Stock.all
	end
	
end
