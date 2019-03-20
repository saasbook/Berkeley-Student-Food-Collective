def create_new_vendor(details) 
	ActionController::Parameters.new(vendor: details)
								.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram)
end