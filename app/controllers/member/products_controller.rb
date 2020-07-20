class Member::ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
        @cart_item =  CartItem.new
	end
    def index
    	@genres = Genre.all
    	if params[:genre_id].present?
    	genre = Genre.find(params[:genre_id])
    	@title = genre.name
    	@products = Product.where(genre_id: params[:genre_id])
    	else
    	@products = Product.all
    	@title = "商品"
    end
    end
end