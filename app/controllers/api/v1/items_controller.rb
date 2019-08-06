class Api::V1::ItemsController < ApplicationController

	before_action :authorize_request
	
	def index
		@items = Item.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @items.present?
	end

end
