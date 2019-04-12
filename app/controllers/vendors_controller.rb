class VendorsController < ApplicationController
  def vendor_params
    # ownership_ids allow us to add existing tags (since it's not supported by nested attributes)
    # nested attributes let us add new tags and remove existing ones
    params.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram,
                                   ownership_ids: [],
                                   ownerships_attributes: [:name, :id, :_destroy])
  end
    
  def new
    # Make new vendor so form knows to make submit button say "Create Vendor"
    # Pass in params from form if redirected from #create
    @vendor = Vendor.new(flash[:vendor_params])
  end

  def create
    # Creates vendor associated with given tags, and creates new tags if necessary
    vendor = Vendor.create(vendor_params)

    if vendor.valid?
      flash[:message] = 'Added Vendor'
      flash[:type] = 'alert alert-success'
      redirect_to vendors_path
    else
      puts vendor.errors.messages
      flash[:message] = 'Vendor needs a unique name'
      flash[:type] = 'alert alert-danger'
      flash[:vendor_params] = vendor_params
      redirect_to new_vendor_path
    end
  end

  def index
    @vendors = Vendor.all
  end

  def edit
    # Get vendor so form knows to make submit button say "Update Vendor"
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    success = vendor.update_attributes(vendor_params)
    if success
      flash[:message] = 'Updated Vendor'
      flash[:type] = 'alert alert-success'
      redirect_to vendors_path
    else
      flash[:message] = 'Vendor needs a unique name'
      flash[:type] = 'alert alert-danger'
      # TODO: Fix redirect causing all changes to be reverted
      redirect_to edit_vendor_path
    end
  end
end
