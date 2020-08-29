class AddPaymentMethodToAccepts < ActiveRecord::Migration[5.2]
  def change
    add_column :accepts, :payment_method, :boolean, default: false, null: false
  end
end
