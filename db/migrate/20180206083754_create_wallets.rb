# frozen_string_literal: true

# Creating Wallet
class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.integer :points

      t.timestamps
    end
  end
end
