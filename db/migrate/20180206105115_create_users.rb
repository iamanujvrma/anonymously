class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :gender

      t.timestamps
    end
  end
end
