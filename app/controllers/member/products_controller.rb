class Member::ProductsController < ApplicationController
	def show
        @genres = Genre.where(is_enabled: true)
		@product = Product.find(params[:id])
        @cart_item =  CartItem.new
	end
    def index
        @genres = Genre.where(is_enabled: true)
    	if params[:genre_id].present?
    	genre = Genre.find(params[:genre_id])
    	@title = genre.name
    	@products = Product.where(genre_id: params[:genre_id], is_capable: true )
    	else
        @products = []
    	@product_statuses = Product.where(is_capable: true)
            @product_statuses.each do |product_status|
                if product_status.genre.is_enabled == "有効"
                    @products << product_status
                end
            end
    	@title = "商品"
        end
    end
end