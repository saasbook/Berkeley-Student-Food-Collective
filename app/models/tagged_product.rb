"""
Created by CS169 Fall 2019 Team.
"""
class TaggedProduct < ActiveRecord::Base
    belongs_to :my_product
    belongs_to :product_tag
end