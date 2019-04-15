class Vendor < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :products
	has_many :vendor_ownerships
	has_many :ownerships, through: :vendor_ownerships

  accepts_nested_attributes_for :ownerships, :allow_destroy => true

  def self.get_ownerships_hash
  	@vendors = self.all
  	@ownerships_hash = {}
  	@vendors.each do |vendor|
  		vendor.ownerships.each do |ownership|
  			if @ownerships_hash.key?(ownership.name)
  				@ownerships_hash[ownership.name].push(vendor)
  			else
  				@ownerships_hash[ownership.name] = [vendor]
  			end
  		end
  	end
  	@ownerships_hash
  end
end
