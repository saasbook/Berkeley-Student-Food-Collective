class VendorsController < ApplicationController
	def vendors_params
		params.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram)
	end
    
	def new
		#should just display new.html.haml
	end
	
	def create
		@vendor = Vendor.create(vendors_params)
		if params[:tags] != nil
			tag_list = params[:tags][:tags].strip
			tags = tag_list.split(/\s*,\s*/)
			tags.each do |tag|
				t = Tag.where(:name => tag).first || Tag.create!(:name => tag)
				# vt = VendorTag.new
				# vt.vendor = @vendor
				# vt.tag = t
				# vt.save!
				VendorTag.create!(:vendor => @vendor, :tag => t)
			end
		end
		flash[:message] = "Added Vendor: #{@vendor.name} to Database"
		redirect_to vendors_path
	end
	
	def index
		
	end

  def edit
		@vendor = Vendor.find(params[:id])
		# vendor_tags = VendorTag.where(:vendor_id => @vendor.id)
		# vendor_tags = VendorTag.joins(:tag).where(:vendor_id => @vendor.id)
		# puts vendor_tags
	end


end