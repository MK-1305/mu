class RemoveProposalIdFromOrderWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_works, :proposal_id, :integer
  end
end
