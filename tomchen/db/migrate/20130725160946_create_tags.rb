class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :parent_id
    end
    add_index :tags, :name
    add_index :tags, :parent_id
  end
end
