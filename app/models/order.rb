class Order < ApplicationRecord
	belongs_to :user
	has_many :listing_works
  has_many :order_works

	enum status: { credit_card: 0, bank_transfer: 1 }
end
