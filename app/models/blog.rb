# t.string   "title"
# t.string   "subtitle"
# t.string   "url_identifier"
# t.string   "stylesheet"
# t.datetime "created_at"
# t.datetime "updated_at"

class Blog < ActiveRecord::Base
  has_many :blog_posts
end
