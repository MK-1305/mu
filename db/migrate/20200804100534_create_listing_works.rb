class CreateListingWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_works do |t|

    t.integer :listing_genre_id
    t.string :name
    t.text :description
    t.boolean :is_sales
    t.integer :count
    t.integer :price
    t.string :image
    t.string :video
    t.string :audio
    t.timestamps
    end
  end
end
