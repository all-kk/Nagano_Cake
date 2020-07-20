class Member::OrdersController < ApplicationController
	def new
		@order = Order.new
		@member = current_member
		@shippings = Shipping.all
	end

end
