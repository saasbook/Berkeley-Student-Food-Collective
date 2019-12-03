"""
Created by CS169 Fall 2019 Team.
"""
class ProductTagsController < ApplicationController

  def index
    render '/my_tags/index'
    @tags = ProductTag.all
  end

  def new 
    render 'admin+/my_tags/new'
  end

  def product_tag_params
    params.require(:product_tag).permit(:name, :description, :picture)
  end

end