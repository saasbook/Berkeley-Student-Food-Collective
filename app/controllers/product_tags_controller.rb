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
    params.require(:product_tag).permit(:product_tag_category_id, :name, :description)
  end

  def create
    if current_admin
      # Creates vendor associated with given tags, and creates new tags if necessary
      # Need create and update_attributes call to handle when I add existing tags, but then remove them all
      product_tag = ProductTag.create(product_tag_params)
      success = product_tag.update_attributes(product_tag_params)
      verify_and_redirect(success, product_tag, discovery_path, product_tag_params)
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
    @product_tag = ProductTag.find(params[:id])
    #@tags = @product.product_tags
  end

end