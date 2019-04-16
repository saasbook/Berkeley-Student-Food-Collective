class DiscoveryController < ApplicationController
  def index
  	# Among other things, we must pick six random tags (3 for product, 3 for vendor)
  	# For each tag, we must do Tag.find_by(name: tag_name).vendors or Tag.find_by(name: tag_name).products 
  	# to find the vendors/products with said tag depending on if it is a vendor or product tag. 
  	# We must also create the products_tags tabe.
  	# We must put each list (corresponding to a tag) in the below @element_list

  	# In the discovery index view, we will go through the element_list and construct a carousel for each list
  	# We will need to iterate through the passed in list of products/vendors 
  	# to create carousel_element partials for each item (not sure how to create one partial for both products + vendors)

  	@ownerships_hash = Vendor.get_ownerships_hash
   	@tags_hash = Product.get_tags_hash

end
