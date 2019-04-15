class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :vendor_id, presence: true

	belongs_to :vendor

  has_many :product_certifications
  has_many :certifications, through: :product_certifications
  has_many :product_nutritions
  has_many :nutritions, through: :product_nutritions
  has_many :product_packagings
  has_many :packagings, through: :product_packagings

  accepts_nested_attributes_for :certifications, :allow_destroy => true
  accepts_nested_attributes_for :nutritions, :allow_destroy => true
  accepts_nested_attributes_for :packagings, :allow_destroy => true

  def self.get_tags_hash
    @products = self.all
    @tags_hash = {}

    @products.each do |product|
      product.nutritions.each do |ownership|
        if @tags_hash.key?(ownership.name)
          @tags_hash[ownership.name].push(product)
        else
          @tags_hash[ownership.name] = [product]
        end
      end
    end

    @products.each do |product|
      product.certifications.each do |ownership|
        if @tags_hash.key?(ownership.name)
          @tags_hash[ownership.name].push(product)
        else
          @tags_hash[ownership.name] = [product]
        end
      end
    end

    @products.each do |product|
      product.packagings.each do |ownership|
        if @tags_hash.key?(ownership.name)
          @tags_hash[ownership.name].push(product)
        else
          @tags_hash[ownership.name] = [product]
        end
      end
    end

    @tags_hash

  end
end
