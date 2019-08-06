class Api::V1::VendorsController < ApplicationController

	before_action :authorize_request
	
	def index
		@vendors = Vendor.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @vendors.present?
	end

end
