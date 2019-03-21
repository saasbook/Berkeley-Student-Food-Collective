def create_new_vendor(details) 
	ActionController::Parameters.new(vendor: details)
								.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram)
end

def create_new_product(details)
ActionController::Parameters.new(product: details)
								.require(:product).permit(:name, :vegan, :gluten_free, :dairy_free, :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id, :tags)
end
