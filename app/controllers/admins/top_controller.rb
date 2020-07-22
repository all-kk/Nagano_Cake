class Admins::TopController < ApplicationController
	def top
		range = Date.today.beginning_of_day..Date.today.end_of_day
		@order = Order.where(created_at: range)
	end
end
