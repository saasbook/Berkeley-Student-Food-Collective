class Ownership < ApplicationRecord
  has_many :vendor_ownerships
  has_many :vendors, through: :vendor_ownerships
end
