class ProductsController < ApplicationController
  before_action :get_vendors

  def get_vendors
    @vendors = Vendor.all
  end

  def product_params
    params.require(:product).permit(:name, :picture, :vegan, :gluten_free, :dairy_free, :organic, 
                                    :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id,
                                    certification_ids: [],
                                    certifications_attributes: [:name, :id, :_destroy],
                                    nutrition_ids: [],
                                    nutritions_attributes: [:name, :id, :_destroy],
                                    packaging_ids: [],
                                    packagings_attributes: [:name, :id, :_destroy])
  end

  def product_params_without_ids
    params.require(:product).permit(:name, :picture, :vegan, :gluten_free, :dairy_free, :organic,
                                    :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id,
                                    certifications_attributes: [:name, :id, :_destroy],
                                    nutritions_attributes: [:name, :id, :_destroy],
                                    packagings_attributes: [:name, :id, :_destroy])
  end

  def new
    # Make new product so form knows to make submit button say "Create Product"
    # Pass in params from form if redirected from #create
    @product = Product.new(flash[:product_params])
  end

  def create
    product = Product.create(product_params_without_ids)
    success = product.update_attributes(product_params)

    if success
      flash[:message] = "Added Product"
      flash[:type] = 'alert alert-success'
      redirect_to products_path
    else
      flash[:message] = 'Product needs a name and a vendor'
      flash[:type] = 'alert alert-danger'
      flash[:product_params] = product_params
      redirect_to new_product_path
    end
  end

  def index
    @products = Product.all
  end

  def edit
    # Get product so form knows to make submit button say "Update Product"
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    success = product.update_attributes(product_params)
    if success
      flash[:message] = "Updated Product"
      flash[:type] = 'alert alert-success'
      redirect_to products_path
    else
      flash[:message] = 'Product needs a name and a vendor'
      flash[:type] = 'alert alert-danger'
      # TODO: Fix redirect causing all changes to be reverted
      redirect_to edit_product_path
    end
  end
end