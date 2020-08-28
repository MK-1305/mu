class ListingWork < ApplicationRecord
	belongs_to :listing_genre
	belongs_to :user
  has_one :order

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioUploader
end
