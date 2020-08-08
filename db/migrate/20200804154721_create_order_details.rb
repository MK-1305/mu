class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

    t.integer :work_id
    t.integer :order_id
    t.integer :status, default: 0
    t.timestamps
    end
  end
end
