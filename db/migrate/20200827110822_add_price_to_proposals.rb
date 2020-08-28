class AddPriceToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :price, :integer
  end
end
