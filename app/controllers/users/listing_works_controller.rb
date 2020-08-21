class Users::ListingWorksController < ApplicationController
  protect_from_forgery except: :destroy

	def new
		@listing_work = ListingWork.new
	end

	def create
		listing_work = ListingWork.new(listing_work_params)
		listing_work.save!
		redirect_to mypage_path(current_user)
	end

	def show
		@listing_work = ListingWork.find(params[:id])
	end

	def edit
		@listing_work = ListingWork.find(params[:id])
	end

	def update
		@listing_work = ListingWork.find(params[:id])
    respond_to do |format|
      if @listing_work.update(listing_work_params) && @listing_work.video.recreate_versions!
        format.html { redirect_to mypage_path, notice: '登録商品を更新しました' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listing_work.errors, status: :unprocessable_entity }
      end
    end
	end

	def index
    	@listing_genres = ListingGenre.where(is_valid: true)
    	if params[:listing_genre_id]
      		@listing_genre = @listing_genres.find(params[:listing_genre_id])
      		all_listings = @listing_genre.listing_works
    	else
      		all_listings = ListingWork.where(is_sales: true)
    	end
    	@listing_works = all_listings.page(params[:page]).per(12)
    	@all_listings_count = all_listings.count
  	end

	def destroy
		@listing_work = ListingWork.find(params[:id])
		@listing_work.destroy
		redirect_to mypage_path
	end


	private

  	def listing_work_params
    	params.require(:listing_work).permit(:name, :description, :listing_genre_id, :price, :is_sales, :user_id, :count, :image, :video, :audio)
  	end


end
