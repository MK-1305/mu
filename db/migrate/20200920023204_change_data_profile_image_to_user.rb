class ChangeDataProfileImageToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :profile_image, :string
  end
end
