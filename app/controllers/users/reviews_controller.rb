class Users::ReviewsController < ApplicationController

	def new
		@review = Review.new
		@listing_work = ListingWork.find(params[:listing_work_id])
	end

	def create
		@review = Review.new(review_params)
		@review.save
		redirect_to orders_path
	end

	private

	def review_params
		params.require(:review).permit(:title, :body, :rate)
	end
end
