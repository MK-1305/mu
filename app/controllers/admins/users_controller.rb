class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.page(params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    	@user.update(user_params) ? (redirect_to admins_user_path(@user)) : (render :edit)
  	end

  	private

  	def user_params
    	params.require(:user).permit(:name, :email, :is_unsubscribe)
  	end
end
