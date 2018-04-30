class AddUseridToWallets < ActiveRecord::Migration[5.1]
  def change
  		add_column :wallets, :user_id, :integer
  end
end
