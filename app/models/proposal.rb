class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :order_work,optional: true
  has_one :accept

  validates :statement, presence: true
  validates :term, presence: true
  validates :price, presence: true
end
