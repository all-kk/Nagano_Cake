class Member::OrdersController < ApplicationController

	def thanks
	end

	def new
<<<<<<< HEAD
<<<<<<< HEAD
		@order = Order.new
		@member = current_member
=======
		@order = Order.new(order_params)
=======
		@order = Order.new
>>>>>>> 1ba2a8ae4823020c6d458bd901801192e4e14715
		@member = current_member
		@shippings = Shipping.all
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
	    redirect_to member_thanks_order_path(current_member.id)
	end


	private

	def shipping_params
		params.permit(:address, :postcode, :name, :member_id)
	end

	def order_params
<<<<<<< HEAD
		params.permit(:payment_method, :address, :postcode, :name, :total_products_cost, :postage)
>>>>>>> b699215168777ee931896479844f714efaacf714
	end
<<<<<<< HEAD

	def confirm
=======
		params.require(:order).permit(:payment_method, :address, :postcode, :name, :total_products_cost, :postage)
>>>>>>> 1ba2a8ae4823020c6d458bd901801192e4e14715
	end


=======
>>>>>>> 50ce59b2cadfcb2149ff640e1f0d0e6b2d68eb34
end
