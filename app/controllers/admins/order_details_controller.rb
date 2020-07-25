class Admins::OrderDetailsController < ApplicationController
	before_action :authenticate_admin!
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order = @order_detail.order
		@order_detail.update(order_detail_params)
		if @order_detail.work_status=="制作中"
			@order.update(status: 2)
		elsif @order.order_details.count ==  @order.order_details.where(work_status: "制作完了").count
			  @order.update(status: 3)
		end
			redirect_to admins_order_path(@order)
	end
	private
	def order_detail_params
		params.require(:order_detail).permit(:work_status)
	end
end
