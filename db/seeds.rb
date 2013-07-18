class Blogpost < ActiveRecord::Base
  self.table_name = "blogposts"
end

Blogpost.create( :title => "Hello World", :content => "This is just a test post made through the seed mechanism")