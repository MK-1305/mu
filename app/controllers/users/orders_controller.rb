class Users::OrdersController < ApplicationController

	def new
		@order = Order.new
		@listing_work = ListingWork.find(params[:listing_work_id])
	end

	def create
		order = Order.new(order_params)
		order.save
		redirect_to thanks_path
	end

	def thanks
	end

  def index
      @orders = current_user.orders.page(params[:page]).reverse_order
  end

  def show
  end


	private

  	def order_params
    	params.require(:order).permit(:user_id, :payment_method, :listing_work_id)
  	end
end
