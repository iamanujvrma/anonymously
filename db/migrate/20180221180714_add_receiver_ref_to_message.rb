class AddReceiverRefToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :receiver, foreign_key: {to_table: :users}
  end
end
