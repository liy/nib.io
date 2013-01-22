class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end

    add_index :favourites, :user_id
    add_index :favourites, :book_id
    add_index :favourites, [:user_id, :book_id], :unique => true
  end
end
