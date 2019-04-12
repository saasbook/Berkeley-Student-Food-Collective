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

  has_many :product_certifications
	has_many :certifications, through: :product_certifications

  accepts_nested_attributes_for :certifications, :allow_destroy => true

  has_many :product_nutritions
	has_many :nutritions, through: :product_nutritions

  accepts_nested_attributes_for :nutritions, :allow_destroy => true

  has_many :product_packagings
	has_many :packagings, through: :product_packagings

  accepts_nested_attributes_for :packagings, :allow_destroy => true
end
