class Api::V1::VendorsController < ApplicationController

	before_action :authorize_request
	
	def index
		@vendors = Vendor.all
	end

end
