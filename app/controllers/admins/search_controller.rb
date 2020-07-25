class Admins::SearchController < ApplicationController
	before_action :authenticate_admin!
	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@datas = search_for(@model, @content)
	end
	private
	def search_for(model, content)
		if model == 'member'
      		Member.where("first_name LIKE ?", "%#{content}%")
    	elsif model == 'product'
      		Product.where("name LIKE ?", "%#{content}%")
  		end
	end
end
