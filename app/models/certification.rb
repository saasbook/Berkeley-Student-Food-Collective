class Certification < Tag
  validates :name, presence: true, uniqueness: true

  has_many :product_certifications
  has_many :products, through: :product_certifications
end
