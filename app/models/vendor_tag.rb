class VendorTag < ApplicationRecord
  belongs_to :vendor
  belongs_to :tag
end
