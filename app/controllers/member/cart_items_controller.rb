class Member::CartItemsController < ApplicationController
	def index
		@cart_items = current_member.cart_items
		@total = 0
	end
	def create
		@cart_item =  CartItem.new(cart_item_params)
		@cart_item.member_id = current_member.id
		@cart_item.save
		redirect_to member_cart_items_path
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
end
