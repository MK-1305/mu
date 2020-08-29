class OrderWork < ApplicationRecord
	belongs_to :order_genre
	belongs_to :user
  belongs_to :accept, optional: true
  has_one :order
  has_many :proposals, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioUploader
end
