class AddListingWorkRefToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :listing_work, foreign_key: true
  end
end