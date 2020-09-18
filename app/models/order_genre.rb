class OrderGenre < ApplicationRecord
	has_many :order_works

	validates :name, presence: true
end
