class CreateAuthorings < ActiveRecord::Migration
  def change
    create_table :authorings do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end

    add_index :authorings, :user_id
    add_index :authorings, :book_id
    add_index :authorings, [:user_id, :book_id], :unique => true
  end
end
