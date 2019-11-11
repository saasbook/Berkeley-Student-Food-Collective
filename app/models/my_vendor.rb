"""
Created by CS169 Fall 2019 Team.
"""
class MyVendor < ActiveRecord::Base
    has_many :my_products
    has_many :tagged_vendors
    has_many :producer_tags, :through => :tagged_vendors
end