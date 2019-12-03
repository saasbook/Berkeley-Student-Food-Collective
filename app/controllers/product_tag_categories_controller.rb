"""
Created by CS169 Fall 2019 Team.
"""
class ProductTagCategoriesController < ApplicationController

  def new 
    if current_admin
			@tag_category = ProductTagCategory.new(flash[:prev_params])
      render 'admin+/tag_categories/new'
		else
			redirect_to(discovery_path)
		end
  end

  def product_tag_category_params
    params.require(:product_tag_category).permit(:name, :description, :picture)
  end

end