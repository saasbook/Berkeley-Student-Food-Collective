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
    @products = Product.all
    @return = self.get_nutritions(@products).merge(self.get_certifications(@products))
    @return.merge(self.get_packagings(@products))
  end

  def self.get_nutritions(products)
    @nut_hash = {}
    products.each do |product|
      product.nutritions.each do |nutrition|
        if @nut_hash.key?(nutrition.name)
          @nut_hash[nutrition.name].push(product)
        else
          @nut_hash[nutrition.name] = [product]
        end
      end
    end
    @nut_hash
  end

  def self.get_certifications(products)
    @cert_hash = {}

    products.each do |product|
      product.certifications.each do |cert|
        if @cert_hash.key?(cert.name)
          @cert_hash[cert.name].push(product)
        else
          @cert_hash[cert.name] = [product]
        end
      end
    end
    @cert_hash
  end

  def self.get_packagings(products)
    @pack_hash = {}

    products.each do |product|
      product.packagings.each do |packaging|
        if @pack_hash.key?(packaging.name)
          @pack_hash[packaging.name].push(product)
        else
          @pack_hash[packaging.name] = [product]
        end
      end
    end
    @pack_hash
  end

end
