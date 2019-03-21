class VendorsController < ApplicationController
    def vendors_params
        params.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram)
    end
    
	def new
		#should just display new.html.haml
	end
	
	def create
		byebug
	    @vendor = Vendor.create!(vendors_params)
	    byebug
	    tag_list = params[:tags][:tags].strip
	    tags = tag_list.split(/\s*,\s*/)
	    tags.each do |tag|
	    	t = Tag.where(:name => tag).first || Tag.create!(:name => tag)
	    	vt = VendorTag.new
	    	vt.vendor = @vendor
	    	vt.tag = t
	    	vt.save!
	    end
	    
        flash[:message] = "Added Vendor: #{@vendor.name} to Database"
        redirect_to vendors_path
	end
	
	def index
		
	end
end