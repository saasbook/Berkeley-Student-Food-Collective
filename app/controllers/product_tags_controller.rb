"""
Created by CS169 Fall 2019 Team.
"""
class ProductTagsController < ApplicationController

    def index
      render '/my_tags/index'
    end

    def new
    	# Make new product so form knows to make submit button say "Create Product"
    	# Pass in params from form if redirected from #create
    	@producer_tag = ProductTag.new(flash[:prev_params])
  	end
  
  end