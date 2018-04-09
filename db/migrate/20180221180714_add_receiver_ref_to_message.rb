class AddReceiverRefToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :receiver, foreign_key: true
  end
end
