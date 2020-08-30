class RemovePaymentMethodFromAccepts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accepts, :payment_method, :boolean
  end
end
