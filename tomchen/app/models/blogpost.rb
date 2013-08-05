class Blogpost < ::ActiveRecord::Base
  has_many :blogpost_tag_relationships
  has_many :tags, :through => :blogpost_tag_relationships
end