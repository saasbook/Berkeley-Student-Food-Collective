class Product < ActiveRecord::Base
	belongs_to :vendor
	validates :name, presence: true
	validates :vendor_id, presence: true
end
