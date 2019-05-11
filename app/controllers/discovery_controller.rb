class DiscoveryController < ApplicationController
  def index
  	@hashes = {product: Product.get_tags_hash, vendor: Vendor.get_ownerships_hash}
   end
end
