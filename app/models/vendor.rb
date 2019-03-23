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
	validates :name, presence: true, uniqueness: true
	# accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => :tag_exists
  accepts_nested_attributes_for :tags, :allow_destroy => true

  # Check if tag exists while creating/updating so duplicate tags are not generated
  # def tag_exists(tag_attr)
  #   tag = Tag.find_by_name(tag_attr[:name])
  #   if tag
  #     self.tags << tag
  #     return true
  #   end
  #   return false
  # end
end
