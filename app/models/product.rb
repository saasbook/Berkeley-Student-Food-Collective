class Product < ActiveRecord::Base
  validate :picture_has_correct_format

  def picture_has_correct_format
    unless picture.blank? || picture.downcase.start_with?('https://', 'http://')
      errors.add(:picture, 'must start with https:// or http://')
    end
  end

  validates :name, presence: true
  validates :vendor_id, presence: true

  belongs_to :vendor

  has_many :product_certifications, dependent: :destroy
  has_many :certifications, through: :product_certifications, dependent: :destroy
  has_many :product_nutritions, dependent: :destroy
  has_many :nutritions, through: :product_nutritions, dependent: :destroy
  has_many :product_packagings, dependent: :destroy
  has_many :packagings, through: :product_packagings, dependent: :destroy

  accepts_nested_attributes_for :certifications, :allow_destroy => true
  accepts_nested_attributes_for :nutritions, :allow_destroy => true
  accepts_nested_attributes_for :packagings, :allow_destroy => true

  def self.get_tags_hash
    tags_hash = {}
    [:certification, :nutrition, :packaging].each do |tag_type|
      tags_hash.update(get_tag_type_hash(tag_type))
    end
    tags_hash.update(get_dietary_and_rfc_tags(tags_hash))
  end

  def self.get_tag_type_hash(tag_type)
    tag_klass = tag_type.to_s.camelize.constantize  # Symbol to actual class
    tag_hash = tag_klass.all.each_with_object({}) do |tag, hash|
      products_array = tag.products.to_a
      if products_array.present? and products_with_pictures(products_array).length >= 4
        hash[tag.name] = products_array
      end
    end
    tag_hash
  end
  
  def self.get_dietary_and_rfc_tags(tags_hash)
    tags = [:vegan, :gluten_free, :dairy_free, :lc_based, :fair, :eco_sound, :humane]
    tags.each do |tag|
      products_array = Product.all.select { |product| product[tag] }
      if products_with_pictures(products_array).length >= 4
        tags_hash[tag.to_s.titleize] = products_array
      end
    end
    tags_hash
  end

  def self.products_with_pictures(products_array)
    products_array.reject { |product| product.picture.blank? }
  end
end