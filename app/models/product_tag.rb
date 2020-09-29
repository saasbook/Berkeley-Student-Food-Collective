# Created by CS169 Fall 2019 Team.

class ProductTag < ActiveRecord::Base
    belongs_to :product_tag_category
    has_many :tagged_products
    has_many :my_products, :through => :tagged_products
end