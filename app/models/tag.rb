class Tag < ActiveRecord::Base
  has_many :vendor_tags
  has_many :vendors, :through => :vendor_tags
  # validates :name, presence: true, uniqueness: true
  validates :name, presence: true
end