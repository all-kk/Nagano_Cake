class Member::CartItemsController < ApplicationController
	before_action :authenticate_member!
	 before_action :cart_item_item?, only: [:create]
	def index
		@cart_items = current_member.cart_items
		@total = 0
	end
	def create
		if nil != current_member.cart_items.find_by(product_id: params[:cart_item][:product_id])
			 @cart_item_add = current_member.cart_items.find_by(product_id: params[:cart_item][:product_id])
			 @cart_item_add.number += params[:cart_item][:number].to_i
			 @cart_item_add.update(number: @cart_item_add.number)
			 redirect_to member_cart_items_path
		else
			@cart_item =  CartItem.new(cart_item_params)
			@cart_item.member_id = current_member.id
			if @cart_item.save
			   redirect_to member_cart_items_path
			else
			   @cart_items = current_member.cart_items
			   @total = 0
			   render 'index'
			end
		end
	end
	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to member_cart_items_path
	end
	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to member_cart_items_path
	end
	def destroy_all
		@cart_items = current_member.cart_items
		@cart_items.destroy_all
		redirect_to member_cart_items_path
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:product_id, :number, :member_id)
	end
	def cart_item_item?
		redirect_to member_product_path(params[:cart_item][:product_id]), notice: "個数を入力してください。" if params[:cart_item][:number].empty?
	end
end
