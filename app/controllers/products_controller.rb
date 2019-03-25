class ProductsController < ApplicationController
  before_action :get_vendors

  def get_vendors
    @vendors = Vendor.all
  end

  def product_params
    params.require(:product).permit(:name, :vegan, :gluten_free, :dairy_free, :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id)
  end

  def new
    # Make new product so form knows to make submit button say "Create Product"
    # Pass in params from form if redirected from #create
    @product = Product.new(flash[:product_params])
  end

  def create
    product = Product.create(product_params)
    if product.valid?
      flash[:message] = "Added Product: #{product.name} to Database"
      flash[:type] = 'alert alert-success'
      redirect_to products_path
    else
      flash[:message] = 'Product needs a name and a vendor'
      flash[:type] = 'alert alert-danger'
      flash[:product_params] = product_params
      redirect_to new_product_path
    end
  end

  def edit
    # Get product so form knows to make submit button say "Update Product"
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    success = product.update_attributes(product_params)
    if success
      flash[:message] = "Updated Product: #{product.name} to Database"
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