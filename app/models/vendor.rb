#t.string "name"
#t.string "description"
#t.string "address"
#t.string "facebook"
#t.string "twitter"
#t.string "instagram"
#t.datetime "created_at", null: false
#t.datetime "updated_at", null: false


class Vendor < ActiveRecord::Base
	has_many :products
	has_many :vendor_tags
	has_many :tags, :through => :vendor_tags
	accepts_nested_attributes_for :tags, :allow_destroy => true
end
