class Api::V1::BatchesController < ApplicationController

	def create
	    batch = Batch.create(batch_params)
	    render json: batch
	end

	def index
		render json: Batch.all
	end

	def show
	end

	def update
		batch = Batch.find(params[:id])
	    batch.update_attributes(batch_params)
	    render json: batch
	end

	def destroy
		Batch.destroy(params[:id])
	end

	private

	def batch_params
		params.require(:batch).permit(:id, :user_id, :item_variant_id, :code, :manufacturing_date, :expiry_date, :status, :created_by, :updated_by)
	end

end
