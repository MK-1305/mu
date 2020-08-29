class AddProposalIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :proposal, index: true
  end
end
