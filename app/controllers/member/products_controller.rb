class Member::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to admins_products
	end
	private
	def product_params
  	params.require(:product).permit(:name)
  	end
end
