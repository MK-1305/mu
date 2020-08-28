class RemoveOrderWorkIdFromProposals < ActiveRecord::Migration[5.2]
  def change
    remove_column :proposals, :order_work_id, :integer
  end
end
