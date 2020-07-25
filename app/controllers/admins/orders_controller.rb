class Admins::OrdersController < ApplicationController
		before_action :authenticate_admin!
	def index
		if request.referer.include?('/admins/top')
			range = Date.today.beginning_of_day..Date.today.end_of_day
			@orders = Order.where(created_at: range).page(params[:page]).reverse_order
		else
			@orders = Order.page(params[:page]).reverse_order
		end
	end
	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end
	def update
		@order = Order.find(params[:id])
		@order_details = @order.order_details
		@order.update(order_params)
		if @order.status=="入金確認"
			@order_details.update_all(work_status: 1)
		end
		redirect_to admins_order_path(@order)
	end
	private
	def order_params
		params.require(:order).permit(:status)
	end
end