class Member::ShippingsController < ApplicationController
	def index
		@shipping = Shipping.new
		@shippings = Shipping.all
	end

	def create
		@shipping = Shipping.new(shipping_params)
		@shipping.member_id = current_member.member_id
		@shipping.save
		redirect_to shippings_path
	end

	def edit
		@shipping = Shipping.find(params[:id])
	end

	def update
		@shipping = Shipping.find(params[:id])
		@shipping.update(shipping_params)
		redirect_to shippings_path
	end

	def destroy
		shipping = Shipping.find(params[:id])
		shipping.destroy(shipping_params)
		redirect_to shippings_path
	end

	private

	def shipping_params
		params.require(:shipping).permit(:member_id, :name, :postcode, :address)
	end
end
