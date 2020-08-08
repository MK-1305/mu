class Users::UsersController < ApplicationController

	def show
	end

	def edit
		@user = current_user
	end

	def update
	 	@user = current_user
		if  @user.update(user_params)
      		redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    	else
      		render :edit
    	end
	end

	def unsubscribe
	end

	def confirm
		@user.update(is_unsubscribe: true)
	    reset_session
	    redirect_to root_path, notice: '退会処理が完了しました。'
	end

	private

  	def user_params
    	params.require(:user).permit(:name, :email, :profile_image)
  	end
end
