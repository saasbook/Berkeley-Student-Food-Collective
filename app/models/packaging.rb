class Packaging < ApplicationRecord
  has_many :product_packagings
  has_many :products, through: :product_packagings
end
