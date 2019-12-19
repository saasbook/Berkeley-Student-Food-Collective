"""
Created by CS169 Fall 2019 Team.
"""
class MyProduct < ActiveRecord::Base
    belongs_to :my_vendor

    has_many :tagged_products, dependent: :destroy
    has_many :product_tags, through: :tagged_products
    accepts_nested_attributes_for :product_tags, :allow_destroy => true

  def self.products_with_pictures(products_array)
    products_array.reject { |product| product.picture.blank? }
  end
end