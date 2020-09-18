class ListingGenre < ApplicationRecord
	has_many :listing_works

	validates :name, presence: true
end
