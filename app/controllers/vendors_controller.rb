class VendorsController < ApplicationController
    def vendors_params
        params.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram)
    end
    
	def new
		#should just display new.html.haml
	end
	
	def create
	    @vendor = Vendor.create!(vendors_params)
        flash[:message] = "Added Vendor: #{@vendor.name} to Database"
        redirect_to vendors_path
	end
	
	def index
		
	end
end