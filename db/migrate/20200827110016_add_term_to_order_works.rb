class AddTermToOrderWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :order_works, :term, :string
  end
end
