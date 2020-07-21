class Member::OrdersController < ApplicationController
	def new
		@order = Order.new
		@member = current_member
		@shippings = Shipping.all
	end

	def confirm
		params[:order][:payment_method] = params[:order][:payment_method].to_i
		@order = Order.new
		@cart_items = CartItem.where(member_id: current_member.id)
		@total = 0

		if    params[:order][:address_number] == "0"
			  @order.postcode = current_member.postcode
			  @order.address = current_member.address
			  @order.name = current_member.last_name

		elsif params[:order][:address_number] == "1"
			  @order.postcode = Shipping.find(params[:order][:shipping]).postcode
			  @order.address = Shipping.find(params[:order][:shipping]).address
			  @order.name = Shipping.find(params[:order][:shipping]).name

		elsif params[:order][:address_number] ==  "2"
			  @shipping = Shipping.new
			  @shipping.postcode = params[:order][:postcode]
			  @shipping.address = params[:order][:address]
			  @shipping.name = params[:order][:name]
			  @shipping.member_id = current_member.id
			
			if  @shipping.save
				@order.postcode = @shipping.postcode
				@order.address = @shipping.address
				@order.name = @shipping.name
			end
        end
	end
end
