class Certification < ApplicationRecord
  has_many :product_certifications
  has_many :products, through: :product_certifications
end
