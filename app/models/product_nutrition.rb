class ProductNutrition < ApplicationRecord
  belongs_to :product
  belongs_to :nutrition
end
