class RemoveOrderWorkIdIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_work_id_id, :integer
  end
end
