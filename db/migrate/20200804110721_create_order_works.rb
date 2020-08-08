class CreateOrderWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :order_works do |t|

    t.integer :order_genre_id
    t.integer :proposal_id
    t.string :name
    t.text :description
    t.boolean :is_sales, default: true, null: false
    t.integer :price
    t.string :image
    t.string :video
    t.string :audio
    t.timestamps
    end
  end
end
