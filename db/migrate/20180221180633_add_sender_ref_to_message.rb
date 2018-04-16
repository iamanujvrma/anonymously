class AddSenderRefToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :sender, foreign_key: true
  end
end
