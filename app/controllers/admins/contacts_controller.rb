class Admins::ContactsController < ApplicationController
	protect_from_forgery

	def index
	    @contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
	    @users = User.all
	end

	def edit
	    @contact = Contact.find(params[:id])
	end

	def update
		contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
		contact.update(contact_params)
		user = contact.user
		ContactMailer.send_when_admin_reply(user, contact).deliver_now
		redirect_to admins_users_path
	end

	def destroy
        contact = Contact.find(params[:id])
        contact.destroy
        @contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
        @users = User.all
        render :index
    end

    private
    def contact_params
        params.require(:contact).permit(:title, :body, :reply)
    end
end
