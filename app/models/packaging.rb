class Packaging < Tag
  validates :name, presence: true, uniqueness: true

  has_many :product_packagings
  has_many :products, through: :product_packagings
end
