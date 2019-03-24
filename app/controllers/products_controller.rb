class ProductsController < ApplicationController
  before_action :get_vendors

  def get_vendors
    @vendors = Vendor.all
  end

  def product_params
    params.require(:product).permit(:name, :vegan, :gluten_free, :dairy_free, :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id)
  end
  def new
    #should just display new.html.haml
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    if product.valid?
      flash[:message] = "Added Product: #{product.name} to Database"
      flash[:type] = 'alert alert-success'
    else
      flash[:message] = 'Product needs a name and a vendor'
      flash[:type] = 'alert alert-danger'
    end
    redirect_to products_path
  end

  def index
    #redirect to index.html.haml
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update_attributes(product_params)
    if product.valid?
      flash[:message] = "Updated Product: #{product.name} to Database"
      flash[:type] = 'alert alert-success'
    else
      flash[:message] = 'Product needs a name and a vendor'
      flash[:type] = 'alert alert-danger'
    end
    redirect_to products_path
  end
end
