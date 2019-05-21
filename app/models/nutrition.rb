class Nutrition < Tag
  validates :name, presence: true, uniqueness: true

  has_many :product_nutritions
  has_many :products, through: :product_nutritions
end
