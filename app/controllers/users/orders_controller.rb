class Users::OrdersController < ApplicationController

	def new
    @listing_work = ListingWork.find(params[:listing_work_id])
		@order = Order.new
	end

	def create
		order = Order.new(order_params)
		order.save!
		redirect_to thanks_path
	end

	def thanks
	end

  def index
    @orders = current_user.orders
  end

  def show
  end


	private

  	def order_params
    	params.require(:order).permit(:user_id, :payment_method, :listing_work_id)
  	end

end
