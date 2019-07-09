class Api::V1::StocksController < ApplicationController

	def create
	    stock = Stock.create(stock_params)
	    render json: stock
	end

	def index
		render json: Stock.all
	end

	def show
	end

	def update
		stock = Stock.find(params[:id])
	    stock.update_attributes(stock_params)
	    render json: stock
	end

	def destroy
		Stock.destroy(params[:id])
	end

	private

	def stock_params
		params.require(:stock).permit(:id, :batch_id, :unit_id, :quantity, :active )
	end

end
