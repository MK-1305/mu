class AddListingWorkIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :listing_work_id, foreign_key: true
  end
end
