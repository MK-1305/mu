class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :order_work,optional: true
  belongs_to :accept, optional: true
end
