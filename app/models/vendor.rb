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

  def self.get_tags_hash
    tags_hash = {}
    self.all.each do |vendor|
      vendor.ownerships.each do |ownership|
        if tags_hash.key?(ownership.name)
          tags_hash[ownership.name].push(vendor)
        else
          tags_hash[ownership.name] = [vendor]
        end
      end
    end
    tags_hash
  end
end
