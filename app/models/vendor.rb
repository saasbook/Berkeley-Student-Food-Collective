class Vendor < ActiveRecord::Base
  validate :picture_has_correct_format

  def picture_has_correct_format
    unless picture.blank? || picture.downcase.start_with?('https://', 'http://')
      errors.add(:picture, 'must start with https:// or http://')
    end
  end
  validates :name, presence: true, uniqueness: true

  has_many :products, dependent: :destroy
  has_many :vendor_ownerships, dependent: :destroy
  has_many :ownerships, through: :vendor_ownerships, dependent: :destroy

  accepts_nested_attributes_for :ownerships, :allow_destroy => true

  def self.get_tags_hash
    tags_hash = {}
    Ownership.all.each do |ownership|
      if vendors_with_pictures(ownership.vendors).length >= 4
        tags_hash[ownership.name] = ownership.vendors
      end
    end
    tags_hash
  end

  def self.vendors_with_pictures(vendors_array)
    vendors_array.reject { |vendor| vendor.picture.blank? }
  end
end
