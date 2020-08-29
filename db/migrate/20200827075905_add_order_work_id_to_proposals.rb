class AddOrderWorkIdToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :order_work_id, :integer
  end
end
