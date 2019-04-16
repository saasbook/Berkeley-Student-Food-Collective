class Vendor < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :products
	has_many :vendor_ownerships
	has_many :ownerships, through: :vendor_ownerships

  accepts_nested_attributes_for :ownerships, :allow_destroy => true
end
