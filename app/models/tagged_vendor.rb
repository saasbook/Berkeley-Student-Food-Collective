"""
Created by CS169 Fall 2019 Team.
"""
class TaggedVendor < ActiveRecord::Base
    belongs_to :my_vendor
    belongs_to :producer_tag
end