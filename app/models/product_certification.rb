class ProductCertification < ApplicationRecord
  belongs_to :product
  belongs_to :certification
end
