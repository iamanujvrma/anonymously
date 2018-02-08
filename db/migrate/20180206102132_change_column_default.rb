class ChangeColumnDefault < ActiveRecord::Migration[5.1]
  def up
		change_column_default :messages, :is_liked, 0
		change_column_default :messages, :is_unlocked, 0
		change_column_default :messages, :is_read, 0
  end
  def down
		change_column_default :messages, :is_liked, nil
		change_column_default :messages, :is_unlocked, nil
		change_column_default :messages, :is_read, nil
  end
end
