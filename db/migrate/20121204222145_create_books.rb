class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :summary
      t.string :slug

      t.timestamps
    end
    add_index :books, :slug
  end
end
