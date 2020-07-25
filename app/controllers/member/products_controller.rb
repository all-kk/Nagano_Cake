class Member::ProductsController < ApplicationController
	def show
        @genres = Genre.where(genre_tatus: true)
		@product = Product.find(params[:id])
        @cart_item =  CartItem.new
	end
    def index
        @genres = Genre.where(genre_tatus: true)
    	@genres = Genre.all
    	if params[:genre_id].present?
    	genre = Genre.find(params[:genre_id])
    	@title = genre.name
    	@products = Product.where(genre_id: params[:genre_id])
    	else
    	@products = Product.page(params[:page]).reverse_order
    	@title = "商品"
    end
    end
end