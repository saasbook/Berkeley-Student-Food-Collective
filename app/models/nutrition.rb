class Nutrition < ApplicationRecord
  has_many :product_nutritions
  has_many :products, through: :product_nutritions
end
