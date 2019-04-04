class VendorOwnership < ApplicationRecord
  belongs_to :vendor
  belongs_to :ownership
end
