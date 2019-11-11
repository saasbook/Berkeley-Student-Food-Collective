"""
Created by CS169 Fall 2019 Team.
"""
class ProductTagCategory < ActiveRecord::Base
    has_many :product_tags
end