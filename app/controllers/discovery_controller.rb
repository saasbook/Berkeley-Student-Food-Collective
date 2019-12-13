class DiscoveryController < ApplicationController
  def index
    # In the discovery index view, we will go through the tags and construct a carousel for each tag
    # We will need to iterate through the passed in list of products/vendors
    # to create carousel_element partials for each item

      @hashes = {my_product: MyProduct.get_tags_hash, my_vendor: MyVendor.get_tags_hash}
   end
end
