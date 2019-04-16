class ProductPackaging < ApplicationRecord
  belongs_to :product
  belongs_to :packaging
end
