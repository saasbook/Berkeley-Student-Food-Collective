class Admin::ProductsController < ApplicationController
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

  def product_success(action)
    action = addE(action)
    flash[:message] = "#{action.capitalize}d Product"
    flash[:type] = 'alert alert-success'
    redirect_to admin_products_path
  end

  def product_fail(action, product)
    flash[:message] = product.errors.full_messages
    flash[:type] = 'alert alert-danger'
    if action == "add"
      flash[:product_params] = product_params
      redirect_to new_admin_product_path
    elsif action == "update"
      redirect_to edit_admin_product_path
    end
  end

  def new
    # Make new product so form knows to make submit button say "Create Product"
    # Pass in params from form if redirected from #create
    @product = Product.new(flash[:product_params])
  end

  def create
    # Need create and update_attributes call to handle when I add existing tags, but then remove them all
    product = Product.create(product_params_without_nested)
    success = product.update_attributes(product_params)

    if success
      product_success("add")
    else
      product_fail("add", product)
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
      product_success("update")
    else
      product_fail("update", product)
    end
  end
end