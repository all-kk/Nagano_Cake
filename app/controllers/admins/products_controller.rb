class Admins::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		@product.save!
		redirect_to admins_products_path
	end
	def index
		@products = Product.page(params[:page]).reverse_order
	end
	def show
		@product = Product.find(params[:id])
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to admins_products_path
	end
	private
	def product_params
  	params.require(:product).permit(:name, :explanatory, :genre_id, :price, :is_capable, :image)
  	end
end
