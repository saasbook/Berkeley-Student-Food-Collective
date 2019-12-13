"""
Created by CS169 Fall 2019 Team.
"""
class MyProduct < ActiveRecord::Base
    belongs_to :my_vendor

    has_many :tagged_products, dependent: :destroy
    has_many :product_tags, through: :tagged_products
    accepts_nested_attributes_for :product_tags, :allow_destroy => true

  def self.get_tags_hash
    tags_hash = {}
    ProductTag.all.each do |ownership|
      all_prods = []
      MyProduct.all.each do |prod|
        if (prod.tagslist != nil) && (prod.tagslist.downcase.include? ownership.name.downcase)
          all_prods << prod
        end 
      end  
      if products_with_pictures(all_prods).length >= 4
        tags_hash[ownership.name] = all_prods
      end
    end
    tags_hash
  end

  def self.products_with_pictures(products_array)
    products_array.reject { |product| product.picture.blank? }
  end
end