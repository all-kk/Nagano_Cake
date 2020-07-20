class Member::OrdersController < ApplicationController
	def new
		@order = Order.new
		@member = current_member
		@shippings = Shipping.all
	end

	def confirm
		params[:order][:payment_method] = params[:order][:payment_method].to_i
		@order = Order.new
	end
    
    private
    def order_params
    end 
end
