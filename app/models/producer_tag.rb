"""
Created by CS169 Fall 2019 Team.
"""
class ProducerTag < ActiveRecord::Base
    has_many :tagged_vendors
    has_many :my_vendors, :through => :tagged_vendors
end