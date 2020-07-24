class Member::OrdersController < ApplicationController

	def thanks
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
		@total = 0
	end

	def index
		@orders = current_member.orders
	end

	def index
		@orders = current_member.orders
	end


	def new
		@member = current_member
		@order = Order.new(order_params)
		@shippings = current_member.shippings
	end

	def confirm
		@order = Order.new(payment_method: params[:order][:payment_method].to_i)
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
            @shipping = Shipping.new(shipping_params)
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

	def create
		@order = Order.new(order_params)
		@order.member_id = current_member.id
		@order.save
		current_member.cart_items.each do |cart_item|
		@order_detail = OrderDetail.new
		@order_detail.product_id = cart_item.product_id
		@order_detail.number = cart_item.number
		@order_detail.tax_price = (cart_item.product.price*1.1).round
		@order_detail.order_id =  @order.id
		@order_detail.save!
		end
	    redirect_to member_thanks_order_path(current_member.id)
    end


	private

	def shipping_params
		params.permit(:address, :postcode, :name, :member_id)
	end

	def order_params
		params.require(:order).permit(:payment_method, :address, :postcode, :name, :total_products_cost, :postage)
	end

end
