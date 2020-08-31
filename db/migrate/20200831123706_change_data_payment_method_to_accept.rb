class ChangeDataPaymentMethodToAccept < ActiveRecord::Migration[5.2]
  def change
  	change_column :accepts, :payment_method, :integer
  end
end
