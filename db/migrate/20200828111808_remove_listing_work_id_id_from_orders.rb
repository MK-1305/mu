class RemoveListingWorkIdIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :listing_work_id_id, :integer
  end
end
