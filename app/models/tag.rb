class Tag < ActiveRecord::Base
  has_many :vendor_tags
  has_many :vendors, :through => :vendor_tags
  # validates :name, presence: true, uniqueness: true
  validates :name, presence: true

  # before_save do
  #   tag = Tag.find_by_name(self.name)
  #   if tag and tag.id != self.id
  #     self.id = tag.id
  #   end
  # end
end