class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :body
      t.string :reply
      t.timestamps
    end
  end
end
