class ListingWork < ApplicationRecord
	belongs_to :listing_genre
	belongs_to :user
  belongs_to :order, optional: true

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioUploader
end
