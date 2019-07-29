class Api::V1::ItemsController < ApplicationController

	before_action :authorize_request
	
	def index
		@items = Item.all
	end

end
