# Created by CS169 Fall 2019 Team.
class ProducerTagsController < ApplicationController
	include ControllerVerification


	def index
		if Landing.exists?
			@picture = Landing.last.vendorsbycatpicture
			@description = Landing.last.vendorsbycatdescription
		else
			@picture = nil
			@description = nil
		end
		render '/producer_tags/index'
	end
	
	def new
		if current_admin
			# Make new product so form knows to make submit button say "Create Product"
			# Pass in params from form if redirected from #create
			@producer_tag = ProducerTag.new(flash[:prev_params])
			render '/admin+/vendor_tags/new'
		else
			redirect_to(discovery_path)
		end
	end
	def producer_tag_params
    	params.require(:producer_tag).permit(:product_tag_category_id, :name, :description, :picture)
	end

	def create
		if current_admin
			# Creates vendor associated with given tags, and creates new tags if necessary
			# Need create and update_attributes call to handle when I add existing tags, but then remove them all
			producer_tag = ProducerTag.create(producer_tag_params)
			success = producer_tag.update_attributes(producer_tag_params)
			verify_and_redirect(success, producer_tag, discovery_path, producer_tag_params)
		end
	end


	def edit
		if current_admin
			# Get vendor so form knows to make submit button say "Update Vendor"
			@producer_tag = ProducerTag.find(params[:id])
			# Pass in params from form if redirected from #update
			if flash[:prev_params]
				@producer_tag.assign_attributes(flash[:prev_params])
			end
			render "admin+/vendor_tags/edit"
		else
			redirect_to(my_vendors_path)
		end
	end

	def update
		if current_admin
			prodTag = ProducerTag.find(params[:id])
			success = prodTag.update_attributes(producer_tag_params)
			verify_and_redirect(success, prodTag, producer_tag_path, producer_tag_params)
		end
	end


  	def show
    	@producer_tag = ProducerTag.find(params[:id])
		@myname = @producer_tag.name.downcase
		@tags = []
		MyVendor.all.each do |v|
			if (v.tagslist != nil) && (v.tagslist.downcase.include? @myname)
				@tags << v.id
			end
		end
		render '/producer_tags/show'
  	end
end