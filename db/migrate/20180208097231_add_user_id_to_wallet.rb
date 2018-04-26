# frozen_string_literal: true

# Adding wallet ID to wallet histories
class AddUserIdToWallet < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :user_id, :integer
  end
end
