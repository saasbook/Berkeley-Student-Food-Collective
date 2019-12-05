"""
Created by CS169 Fall 2019 Team.
"""
class MyProductsController < ApplicationController
  include ControllerVerification
  
  before_action :get_vendors
  def get_vendors
    @vendors = MyVendor.all
  end

  def index
    @products = MyProduct.all
  end

  def indextags
    @products = MyProduct.all
  end

  def show
    @product = MyProduct.find(params[:id])
    @tags = @product.product_tags
  end
  
  def product_params
    params.require(:my_product).permit(:my_vendor_id, :name, :picture, :description)
  end

  def product_params_without_nested
    product_params.except(:certifications_attributes, :nutritions_attributes, :packagings_attributes)
  end
    
  def new
    if current_admin
    # Make new product so form knows to make submit button say "Create Product"
    # Pass in params from form if redirected from #create
      @product = MyProduct.new(flash[:prev_params])
      render 'admin+/my_products/new'
    else
      redirect_to(my_products_path)
    end
  end

  def create
    if current_admin
      # Need create and update_attributes call to handle when I add existing tags, but then remove them all
      product = MyProduct.create(product_params_without_nested)
      success = product.update_attributes(product_params)
      verify_and_redirect(success, product, my_products_path, product_params)
    else 
      redirect_to(my_products_path)
    end
  end

  def edit
    if current_admin
      # Get product so form knows to make submit button say "Update Product"
      @product = MyProduct.find(params[:id])
      # Pass in params from form if redirected from #update
      if flash[:prev_params]
        @product.assign_attributes(flash[:prev_params])
      end
    else
      redirect_to(my_products_path)
    end
  end

  def update
    if current_admin
      product = MyProduct.find(params[:id])
      success = product.update_attributes(product_params)
      verify_and_redirect(success, product, my_products_path, product_params)
    else
      redirect_to(my_products_path)
    end
  end

  def destroy
    if current_admin
      product = MyProduct.find(params[:id])
      success = product.destroy
      verify_and_redirect(success, product, my_products_path, nil)
    else
      redirect_to(my_products_path)
    end
  end

end