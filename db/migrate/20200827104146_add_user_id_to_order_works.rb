class AddUserIdToOrderWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :order_works, :user_id, :integer
  end
end
