class AddOrderWorkRefToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :order_work, foreign_key: true
  end
end
