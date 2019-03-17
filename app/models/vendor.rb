class Vendor < ActiveRecord::Base
	has_many :products
	has_many :vendor_tags
	has_many :tags, :through => :vendor_tags
end
