class BlogpostTagRelationship < ActiveRecord::Base
  belongs_to :tag
  belongs_to :blogpost
end