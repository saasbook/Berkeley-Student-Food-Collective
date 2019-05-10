class Vendor < ActiveRecord::Base
  validate :picture_has_correct_format

  def picture_has_correct_format
    unless picture.blank? || picture.downcase.start_with?('https://', 'http://')
      errors.add(:picture, 'must start with https:// or http://')
    end
  end
  validates :name, presence: true, uniqueness: true

  has_many :products
  has_many :vendor_ownerships
  has_many :ownerships, through: :vendor_ownerships

  accepts_nested_attributes_for :ownerships, :allow_destroy => true

  def self.get_ownerships_hash
    @ownerships_hash = {}
    @ownerships = Ownership.all
    @ownerships.each do |ownership|
      @ownerships_hash[ownership.name] = [ownership.vendors, vendors_with_pictures(ownership.vendors).length >= 4]
    end
    @ownerships_hash[0..15]
  end

  def self.vendors_with_pictures(vendors_array)
    vendors_with_pics = vendors_array.reject {|vendor| vendor.picture == ""}
  end
end
