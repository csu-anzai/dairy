class Api::V1::ItemVariantsController < ApplicationController

	before_action :authorize_request
	
	def index
		@item_variants = ItemVariant.all
		render json: {access_code: I18n.t('access_code.failure')}, status: :unprcessable_entity unless @item_variants.present?
	end
	
end
