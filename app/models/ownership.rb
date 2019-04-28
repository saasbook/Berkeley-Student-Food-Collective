class Ownership < Tag
  validates :name, presence: true, uniqueness: true

  has_many :vendor_ownerships
  has_many :vendors, through: :vendor_ownerships
end
