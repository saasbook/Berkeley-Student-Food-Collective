class Tag < ActiveRecord::Base
    has_many :vendor_tags
end