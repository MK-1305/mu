class CreateAccepts < ActiveRecord::Migration[5.2]
  def change
    create_table :accepts do |t|
      t.references :user, index: true
      t.references :order_work, index: true
      t.references :proposal, index: true
      t.timestamps
    end
  end
end
