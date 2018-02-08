class AddColumnsToMessage < ActiveRecord::Migration[5.1]
	def change
		add_column :messages, :receiver_id, :integer
		add_column :messages, :content, :text
		add_column :messages, :is_liked, :integer
		add_column :messages, :is_unlocked, :integer
		add_column :messages, :is_read, :integer
	end
end
