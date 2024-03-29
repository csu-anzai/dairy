class Api::V1::CustomersController < ApplicationController

	before_action :authorize_request, except: [:create]
	before_action :set_customer, only: [:show, :edit, :update, :destroy]
	
	def create
    @customer = Customer.create(customer_params)
    render json: {access_code: I18n.t('access_code.failure'), error: @customer.errors}, status: :unprcessable_entity unless @customer.valid?
	end

	def index
		@customers = Customer.all
	end

	def show
		@customer
	end

	def update
    @customer.update(customer_params)
	  render json: {access_code: I18n.t('access_code.failure'), error: @customer.errors }, status: :unprocessable_entity unless @customer.valid?
	end

	def destroy
		@customer.destroy
  	render json: {access_code: I18n.t('access_code.failure'), errors: @customer.errors }, status: :unprocessable_entity unless @customer
	end

	private

	def set_customer
		@customer = Customer.find_by_id(params[:id])
	  render json: {access_code: I18n.t('access_code.failure'), errors: {customer: I18n.t('api.model.not_found')} }, status: :not_found unless @customer
	end

	def customer_params
		params.require(:customer).permit(:id, :salutation, :name, :gender, :username, :email, :password, :password_confirmation, :mobile, :date_of_birth, :type, :premium, :call_verified, :blacklisted, :active, :created_by, :updated_by )
	end

end
