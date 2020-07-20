class Member::OrdersController < ApplicationController
	def new
		@order = Order.new
		@member = current_member
	end

	def confirm
	end


end
