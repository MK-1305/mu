class AddPaymentMethodToAccepts < ActiveRecord::Migration[5.2]
  def change
    add_column :accepts, :payment_method, :integer
  end
end
