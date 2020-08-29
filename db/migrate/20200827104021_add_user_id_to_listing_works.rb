class AddUserIdToListingWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :listing_works, :user_id, :integer
  end
end
