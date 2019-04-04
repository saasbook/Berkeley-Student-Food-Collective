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
end
