class CreateBlogpostTagRelationship < ActiveRecord::Migration
  def change
    create_table :blogpost_tag_relationships do |t|
      t.integer :blogpost_id
      t.integer :tag_id
    end
    add_index :blogpost_tag_relationships, :tag_id
  end
end
