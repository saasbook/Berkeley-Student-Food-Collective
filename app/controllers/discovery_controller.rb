class DiscoveryController < ApplicationController
  def index
  	#Among other things, we must pick six random tags (3 for product, 3 for vendor)
  	#For each tag, we must do Tag.find_by(name: tag_name).vendors or Tag.find_by(name: tag_name).products 
  	#to find the vendors/products with said tag depending on if it is a vendor or product tag. 
  	#We must also create the products_tags tabe.
  	#We must put each list (corresponding to a tag) in the below @element_list

  	#In the discovery index view, we will go through the element_list and construct a carousel for each list
  	#We will need to iterate through the passed in list of products/vendors 
  	#to create carousel_element partials for each item (not sure how to create one partial for both products + vendors)

  	# VENDOR OWNERSHIPS
  	@vendors = Vendor.all
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
  	
 
  	@element_list = {}

  	# PRODUCT TAGS

  	@tags_hash = {}


  	#@tags.each do |tag|
  	#	@element_list[tag] = tag.vendors
  	#end
  end

end
