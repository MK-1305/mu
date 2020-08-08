class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|

    t.integer :order_work_id
    t.integer :user_id
    t.string :statement
    t.timestamps
    end
  end
end
