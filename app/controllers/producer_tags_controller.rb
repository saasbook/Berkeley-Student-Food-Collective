"""
Created by CS169 Fall 2019 Team.
"""
class ProducerTagsController < ApplicationController

	def index
      render '/my_tags/index'
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
    	else 
      		redirect_to(discovery_path)
    	end
  	end

  	def verify_and_redirect(success, item, index_page, params)
    	if success
      		flash[:message] = 'Success!'
      		flash[:type] = 'alert alert-success'
      		redirect_to index_page
    	else
      		flash[:message] = item.errors.full_messages
      		flash[:type] = 'alert alert-danger'
      		flash[:prev_params] = params
      		redirect_back(fallback_location: index_page)
    	end
  	end

  	def show
    	@producer_tag = ProducerTag.find(params[:id])
    	#@tags = @product.product_tags
  	end
end