class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :expire_at

      t.timestamps
    end

    add_index :subscriptions, :user_id
    add_index :subscriptions, :book_id
    add_index :subscriptions, [:user_id, :book_id], :unique => true
  end
end
