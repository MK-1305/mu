class ContactMailer < ApplicationMailer

	def send_when_admin_reply(user, contact) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @answer = contact.reply_text #返信内容
    mail to: user.email, subject: '【Mu】 お問い合わせありがとうございます'
  end
end
