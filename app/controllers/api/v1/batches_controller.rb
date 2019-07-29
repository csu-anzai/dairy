class Api::V1::BatchesController < ApplicationController

	before_action :authorize_request
	
	def index
		@batches = Batch.all
	end

end
