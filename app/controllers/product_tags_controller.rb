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

  def edit
    if current_admin
      # Get vendor so form knows to make submit button say "Update Vendor"
      @product_tag = ProductTag.find(params[:id])
      # Pass in params from form if redirected from #update
      if flash[:prev_params]
        @product_tag.assign_attributes(flash[:prev_params])
      end
      render "admin+/product_tags/edit"
    else
      redirect_to(my_vendors_path) && return
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
    @myname = @product_tag.name.downcase
    @tags = []
    MyProduct.all.each do |v|
      if (v.tagslist != nil) && (v.tagslist.downcase.include? @myname)
        @tags << v.id
      end
    end
  end

end