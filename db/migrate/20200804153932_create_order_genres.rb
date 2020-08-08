class CreateOrderGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :order_genres do |t|

    t.string :name
    t.boolean :is_valid, default: true
    t.timestamps
    end
  end
end
