class Admin::VendorsController < ApplicationController
  def vendor_params
    # ownership_ids allow us to add existing tags (since it's not supported by nested attributes)
    # nested attributes let us add new tags and remove existing ones
    params.require(:vendor).permit(:name, :picture, :story, :mission, :description, :address, :facebook, :twitter, :instagram,
                                   ownership_ids: [],
                                   ownerships_attributes: [:name, :id, :_destroy])
  end

  def vendor_params_without_nested
    vendor_params.except(:ownerships_attributes)
  end

  def vendor_success(action)
    action = addE(action)
    flash[:message] = "#{action.capitalize}d Vendor"
    flash[:type] = 'alert alert-success'
    redirect_to admin_vendors_path
  end

  def vendor_fail(action, vendor)
    flash[:message] = vendor.errors.full_messages
    flash[:type] = 'alert alert-danger'
    if action == "add"
      flash[:vendor_params] = vendor_params
      redirect_to new_admin_vendor_path
    elsif action == "update"
      redirect_to edit_admin_vendor_path
    end
  end
    
  def new
    # Make new vendor so form knows to make submit button say "Create Vendor"
    # Pass in params from form if redirected from #create
    @vendor = Vendor.new(flash[:vendor_params])
  end

  def create
    # Creates vendor associated with given tags, and creates new tags if necessary
    # Need create and update_attributes call to handle when I add existing tags, but then remove them all
    vendor = Vendor.create(vendor_params_without_nested)
    success = vendor.update_attributes(vendor_params)

    if success
      vendor_success("add")
    else
      vendor_fail("add", vendor)
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
      vendor_success("update")
    else
      vendor_fail("update", vendor)
    end
  end
end
