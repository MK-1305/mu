class AddReferencesToContacts < ActiveRecord::Migration[5.2]
  def change
  	add_reference :contacts, :user
  end
end
