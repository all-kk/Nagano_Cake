class Member::OrdersController < ApplicationController
	def new
		@order = Order.new
		@member = current_member
	end
<<<<<<< HEAD

	def confirm
	end


=======
>>>>>>> 50ce59b2cadfcb2149ff640e1f0d0e6b2d68eb34
end
