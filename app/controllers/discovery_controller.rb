class DiscoveryController < ApplicationController
  def index
    # In the discovery index view, we will go through the tags and construct a carousel for each tag
    # We will need to iterate through the passed in list of products/vendors
    # to create carousel_element partials for each item

    @hashes = {product: Product.get_tags_hash, vendor: Vendor.get_tags_hash}
   end
end
