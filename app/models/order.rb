class Order < ApplicationRecord
	belongs_to :user
	belongs_to :listing_work, optional: true
  belongs_to :order_work ,optional: true

	enum status: { credit_card: 0, bank_transfer: 1 }
end
