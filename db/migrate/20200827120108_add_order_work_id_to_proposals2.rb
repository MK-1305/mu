class AddOrderWorkIdToProposals2 < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposals, :order_work, index: true
  end
end
