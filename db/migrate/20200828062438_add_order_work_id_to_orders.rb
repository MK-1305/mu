class AddOrderWorkIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :order_work_id, foreign_key: true
  end
end
