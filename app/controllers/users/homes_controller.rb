class Users::HomesController < ApplicationController
	def top
		@listing_genres = ListingGenre.where(is_valid: true)
		@order_genres = OrderGenre.where(is_valid: true)
	end
end
