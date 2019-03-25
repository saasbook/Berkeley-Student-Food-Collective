class VendorsController < ApplicationController
  def vendors_params
    # Allow tags to be created/destroyed along with vendors
    params.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram,
                                   tags_attributes: [:name, :id, :_destroy])
  end
    
  def new
    # Make new vendor so form knows to make submit button say "Create Vendor"
    # Pass in params if redirected from #create
    @vendor = Vendor.new(flash[:vendors_params])
  end

  def create
    # Creates vendor associated with given tags, and creates new tags if necessary
    vendor = Vendor.create(vendors_params)
    if vendor.valid?
      flash[:message] = "Added Vendor: #{vendor.name} to Database"
      flash[:type] = 'alert alert-success'
      redirect_to vendors_path
    else
      @vendor = Vendor.new(vendors_params)
      flash[:message] = 'Vendor needs a name'
      flash[:type] = 'alert alert-danger'
      flash[:vendors_params] = vendors_params
      redirect_to new_vendor_path
    end
  end

  def edit
    # Get vendor so form knows to make submit button say "Update Vendor"
    # Pass in params if redirected from #update
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    success = vendor.update_attributes(vendors_params)
    if success
      flash[:message] = "Updated Vendor: #{vendor.name} to Database"
      flash[:type] = 'alert alert-success'
      redirect_to vendors_path
    else
      flash[:message] = 'Vendor needs a name'
      flash[:type] = 'alert alert-danger'
      flash[:vendors_params] = vendors_params
      redirect_to edit_vendor_path
    end
  end

end