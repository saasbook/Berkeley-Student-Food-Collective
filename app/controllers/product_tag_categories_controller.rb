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

  def create
    if current_admin
      # Creates vendor associated with given tags, and creates new tags if necessary
      # Need create and update_attributes call to handle when I add existing tags, but then remove them all
      product_category_tag = ProductTagCategory.create(product_tag_category_params)
      success = product_category_tag.update_attributes(product_tag_category_params)
      verify_and_redirect(success, product_category_tag, discovery_path, product_tag_category_params)
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

end