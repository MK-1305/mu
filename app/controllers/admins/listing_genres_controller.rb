class Admins::ListingGenresController < ApplicationController
	before_action :authenticate_admin!

	def index
    	@listing_genre = ListingGenre.new
    	@listing_genres = ListingGenre.all
  	end

	def create
  	@listing_genre = ListingGenre.new(listing_genre_params)
  		if @listing_genre.save
    		redirect_to admins_listing_genres_path
  		else
    		@listing_genres = ListingGenre.all
    		render :index
  		end
	end

	def edit
		@listing_genre = ListingGenre.find(params[:id])
	end

	def update
		@listing_genre = ListingGenre.find(params[:id])
  	if @listing_genre.update(listing_genre_params)
    	unless @listing_genre.is_valid
      	@listing_genre.listing_works.update_all(is_sales: false)
    	end
    	redirect_to admins_listing_genres_path
  	else
    	render :edit
  	end
	end

  private

  def listing_genre_params
    params.require(:listing_genre).permit(:name, :is_valid)
  end
end
