# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.integer :points

      t.timestamps
    end
  end
end
