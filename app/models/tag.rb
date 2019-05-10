class Tag < ActiveRecord::Base
	has_many :products
	has_many :vendors
end