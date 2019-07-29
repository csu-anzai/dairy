class Api::V1::ItemVariantsController < ApplicationController

	before_action :authorize_request
	
	def index
		@item_variants = ItemVariant.all
	end
	
end
