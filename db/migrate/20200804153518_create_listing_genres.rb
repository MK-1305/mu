class CreateListingGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_genres do |t|

    t.string :name
    t.boolean :is_valid, default: true
    t.timestamps
    end
  end
end
