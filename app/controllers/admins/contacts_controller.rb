class Admins::ContactsController < ApplicationController

   def update
    contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
    contact.update(contact_params)
    user = contact.user
    ContactMailer.send_when_admin_reply(user, contact).deliver
  end
end
