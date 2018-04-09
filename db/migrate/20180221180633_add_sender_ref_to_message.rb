class AddSenderRefToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference(:messages, :sender, foreign_key: {to_table: :users})
  end
end
