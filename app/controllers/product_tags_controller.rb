"""
Created by CS169 Fall 2019 Team.
"""
class ProductTagsController < ApplicationController

  def index
    render '/my_tags/index'
    @tags = ProductTag.all
  end

  def new 
    if current_admin
      @product_tag = ProductTag.new(flash[:prev_params])
			render 'admin+/product_tags/new'
		else
			redirect_to(discovery_path)
		end
  end

  def product_tag_params
    params.require(:product_tag).permit(:name, :description, :picture)
  end

end