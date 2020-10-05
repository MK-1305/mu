class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.float :rate, null: false, default: 0
      t.references :user
      t.references :listing_work
      t.timestamps
    end
  end
end
