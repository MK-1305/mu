class AddTermToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :term, :string
  end
end
