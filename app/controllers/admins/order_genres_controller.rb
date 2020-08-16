class Admins::OrderGenresController < ApplicationController
	before_action :authenticate_admin!

	def index
    	@order_genre = OrderGenre.new
    	@order_genres = OrderGenre.all
  	end

	def create
  	@order_genre = OrderGenre.new(order_genre_params)
  		if @order_genre.save
    		redirect_to admins_order_genres_path
  		else
    		@order_genres = OrderGenre.all
    		render :index
  		end
	end

	def edit
		@order_genre = OrderGenre.find(params[:id])
	end

	def update
		@order_genre = OrderGenre.find(params[:id])
  	if @order_genre.update(order_genre_params)
    	unless @order_genre.is_valid
      	@order_genre.order_works.update_all(is_sales: false)
    	end
    	redirect_to admins_order_genres_path
  	else
    	render :edit
  	end
	end

  private

  def order_genre_params
    params.require(:order_genre).permit(:name, :is_valid)
  end
end
