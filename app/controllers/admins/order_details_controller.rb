class Admins::OrderDetailsController < ApplicationController
	def update
		@order_detail = OrderDetail.where(params[:id])
		@order_detail.update(order_detail_params)
		redirect_to admins_orders_path
	end
	private
	def order_detail_params
		params.require(:order_detail).permit(:work_status)
	end
end
