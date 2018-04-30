class CreateWalletHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :wallet_histories do |t|
      t.string :transaction_type
      t.string :recepient_name
      t.integer :points
      t.integer :wallet_id

      t.timestamps
    end
  end
end
