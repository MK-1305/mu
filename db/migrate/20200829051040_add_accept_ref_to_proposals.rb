class AddAcceptRefToProposals < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposals, :accept, foreign_key: true
  end
end
