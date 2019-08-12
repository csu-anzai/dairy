class Api::V1::PagesController < ApplicationController

	def about
		@about = set_page(params[:page][:type])
	end

	def help
		@help = set_page(params[:page][:type]) 
	end

	private

	def set_page(params)
		Page.where("page_type= (?) and active= (?)", params, "1")
	end

end
