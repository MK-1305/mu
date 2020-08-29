class Accept < ApplicationRecord
  belongs_to :user
  has_one :order_work
  has_one :proposal

  enum payment_method: { credit_card: 0, bank_transfer: 1 }
end
