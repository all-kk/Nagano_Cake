class HomesController < ApplicationController
	def top
		@genres = Genre.where(is_enabled: true)

	end
	def about
	end
end
