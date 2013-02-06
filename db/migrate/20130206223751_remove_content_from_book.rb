class RemoveContentFromBook < ActiveRecord::Migration
  def up
    remove_column :books, :content
  end

  def down
    add_column :books, :content, :string
  end
end
