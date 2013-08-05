
class Tag < ActiveRecord::Base
  self.table_name = "tags"
  belongs_to :parent, :class_name => "Tag", :foreign_key => :parent_id
  has_many :children, :class_name => "Tag", :foreign_key => :parent_id
end

["about", "software", "literature", "art", "other"].map { |name| Tag.create :name => name }

{
  :software => ["web apps", "games", "middleware", "services"],
  :literature => ["thoughts", "technical", "misc"],
  :art => ["2D", "3D", "3DPD", "alt"]
}.each do |key, things|
  tag = Tag.find_by_name(key)
  things.map { |thing| tag.children.create :name => thing }
end

class Blogpost < ActiveRecord::Base
  self.table_name = "blogposts"
end

class BlogpostTagRelationship < ActiveRecord::Base
  self.table_name = "blogpost_tag_relationships"

  def self.bind_together(blogpost, tag)
    BlogpostTagRelationship.create(:blogpost_id => blogpost.id, :tag_id => tag.id)    
  end
end

bp = Blogpost.create( :title => "Hello World", :content => "This is just a test post made through the seed mechanism")

BlogpostTagRelationship.bind_together bp, Tag.first
