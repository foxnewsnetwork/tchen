class CreateBlogEntryTable < ActiveRecord::Migration
  def change
    create_table :blog_entry_tables do |t|
      t.string :title
      t.text :content
    end
  end
end
