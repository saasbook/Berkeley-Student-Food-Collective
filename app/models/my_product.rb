"""
Created by CS169 Fall 2019 Team.
"""
class MyProduct < ActiveRecord::Base
    belongs_to :my_vendor
    has_many :tagged_products
    has_many :product_tags, through: :tagged_products
    
end