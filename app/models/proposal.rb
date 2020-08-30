class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :order_work,optional: true
  has_one :accept
end
