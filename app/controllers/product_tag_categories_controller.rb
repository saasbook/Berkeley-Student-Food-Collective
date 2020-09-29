# Created by CS169 Fall 2019 Team.

class ProductTagCategoriesController < ApplicationController
  include ControllerVerification
  

  def new 
    if current_admin
			@tag_category = ProductTagCategory.new(flash[:prev_params])
      render 'admin+/tag_categories/new'
		else
			redirect_to(discovery_path)
		end
  end

  def product_tag_category_params
    params.require(:product_tag_category).permit(:name, :description)
  end

  def show
    @product_tag_category = ProductTagCategory.find(params[:id])
    @name = @product_tag_category.name.downcase
    @tags = []
    ProductTag.all.each do |v|
      if (v.product_tag_category != nil) && (v.product_tag_category.name.downcase == @name)
        @tags << v.id
      end
    end
  end

  def create
    if current_admin
      product_category_tag = ProductTagCategory.create(product_tag_category_params)
      success = product_category_tag.update_attributes(product_tag_category_params)
      product_category_tag.update_attributes(:name => product_category_tag.name.capitalize)
      verify_and_redirect(success, product_category_tag, product_tag_categories_path, product_tag_category_params)
    end
  end

  def update
    if current_admin
      prodTagCategs = ProductTagCategory.find(params[:id])
      success = prodTagCategs.update_attributes(product_tag_category_params)
      prodTagCategs.update_attributes(:name => prodTagCategs.name.capitalize)
      verify_and_redirect(success, prodTagCategs, product_tag_category_path(params[:id]), product_tag_category_params)
    end
  end

  def edit
    if current_admin
      @product_tag_category = ProductTagCategory.find(params[:id])
      if flash[:prev_params]
        @product_tag_category.assign_attributes(flash[:prev_params])
      end
      render "admin+/tag_categories/edit"
    else
      redirect_to(product_categories_path) && return
    end
  end

  def index
    @categories = ProductTagCategory.all
    render '/product_tag_categories/index'
  end


end