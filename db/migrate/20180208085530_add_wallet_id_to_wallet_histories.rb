# frozen_string_literal: true

class AddWalletIdToWalletHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :wallet_histories, :wallet_id, :integer
  end
end
