class Api::V1::AttributeChoicesController < ApplicationController

	before_action :authorize_request

	def index
		@attribute_choices = AttributeChoice.all
	end

end
