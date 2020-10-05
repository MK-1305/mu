class Users::ReviewsController < ApplicationController

	def new
		@review = Review.new
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
