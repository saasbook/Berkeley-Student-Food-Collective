"""
Created by CS169 Fall 2019 Team.
"""
class ProducerTagsController < ApplicationController

    def index
      render '/my_tags/index'
    end
  	def new
    	# Make new product so form knows to make submit button say "Create Product"
    	# Pass in params from form if redirected from #create
		@producer_tag = ProducerTag.new(flash[:prev_params])
		render '/admin+/producer_tags/new'
  	end
  
  end