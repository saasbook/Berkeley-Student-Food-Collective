class Admin::ProductsController < ApplicationController
  include ControllerVerification

  before_action :get_vendors

  def get_vendors
    @vendors = Vendor.all
  end

  def product_params
    params.require(:product).permit(:name, :picture, :origin, :cultural_history, :vegan, :gluten_free, :dairy_free, 
                                    :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id,
                                    certification_ids: [],
                                    certifications_attributes: [:name, :id, :_destroy],
                                    nutrition_ids: [],
                                    nutritions_attributes: [:name, :id, :_destroy],
                                    packaging_ids: [],
                                    packagings_attributes: [:name, :id, :_destroy])
  end

  def product_params_without_nested
    product_params.except(:certifications_attributes, :nutritions_attributes, :packagings_attributes)
  end

  def new
    # Make new product so form knows to make submit button say "Create Product"
    # Pass in params from form if redirected from #create
    @product = Product.new(flash[:prev_params])
  end

  def create
    # Need create and update_attributes call to handle when I add existing tags, but then remove them all
    product = Product.create(product_params_without_nested)
    success = product.update_attributes(product_params)
    verify_and_redirect(success, product, admin_products_path, product_params)
  end

  def index
    @products = Product.all
  end

  def edit
    # Get product so form knows to make submit button say "Update Product"
    @product = Product.find(params[:id])
    # Pass in params from form if redirected from #update
    if flash[:prev_params]
      @product.assign_attributes(flash[:prev_params])
    end
  end

  def update
    product = Product.find(params[:id])
    success = product.update_attributes(product_params)
    verify_and_redirect(success, product, admin_products_path, product_params)
  end

  def destroy
    product = Product.find(params[:id])
    success = product.destroy
    verify_and_redirect(success, product, admin_products_path, nil)
  end
end