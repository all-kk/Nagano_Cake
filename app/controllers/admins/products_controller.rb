class Admins::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to admins_products
	end
	def index
		@products = Product.all
	end
	def edit
	end
	def update
	end
	private
	def product_params
  	params.require(:product).permit(:name)
  	end
end
