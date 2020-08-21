class Users::OrderWorksController < ApplicationController

	def new
		@order_work = OrderWork.new
	end

	def create
		order_work = OrderWork.new(order_work_params)
		order_work.save!
		redirect_to mypage_path(current_user)
	end

  def show
    @order_work = OrderWork.find(params[:id])

  end

	def edit
		@order_work = OrderWork.find(params[:id])
	end

	def index
    	@order_genres = OrderGenre.where(is_valid: true)
    	if params[:order_genre_id]
      		@order_genre = @order_genres.find(params[:order_genre_id])
      		all_orders = @order_genre.order_works
    	else
      		all_orders = OrderWork.where(is_sales: true)
    	end
    	@order_works = all_orders.page(params[:page]).per(12)
    	@all_orders_count = all_orders.count
	end

	def update
    @order_work = OrderWork.find(params[:id])
    respond_to do |format|
      if @order_work.update(order_work_params) && @order_work.video.recreate_versions!
        format.html { redirect_to mypage_path, notice: '依頼作品を更新しました' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_work.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
	end


	private

  	def order_work_params
    	params.require(:order_work).permit(:name, :description, :order_genre_id, :price, :is_sales, :user_id, :term, :image, :video, :audio)
  	end
end
