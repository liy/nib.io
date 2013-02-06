class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :content
      t.belongs_to :book

      t.timestamps
    end
    add_index :sections, :book_id
  end
end
