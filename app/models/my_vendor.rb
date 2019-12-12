# Created by CS169 Fall 2019 Team.
class MyVendor < ActiveRecord::Base
  validate :picture_has_correct_format

  def picture_has_correct_format
    unless picture.blank? || picture.downcase.start_with?('https://', 'http://')
      errors.add(:picture, 'must start with https:// or http://')
    end
  end
  validates :name, presence: true, uniqueness: true

  has_many :my_products, dependent: :destroy
  has_many :tagged_vendors, dependent: :destroy
  has_many :producer_tags, :through => :tagged_vendors

  accepts_nested_attributes_for :producer_tags, :allow_destroy => true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def self.get_tags_hash
    # tags_hash = {}
    # Ownership.all.each do |ownership|
    #   if vendors_with_pictures(ownership.vendors).length >= 4
    #     tags_hash[ownership.name] = ownership.vendors
    #   end
    # end
    # tags_hash
  end

  # def self.vendors_with_pictures(vendors_array)
  #   vendors_array.reject { |vendor| vendor.picture.blank? }
  # end

end