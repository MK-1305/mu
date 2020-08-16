class User < ApplicationRecord
  has_many :listing_works
  has_many :order_works
  has_many :orders
  has_many :chats
  has_many :proposals, dependent: :destroy
  mount_uploader :profile_image, ImageUploader

  def active_for_authentication?
    super && (self.is_unsubscribe == false)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
