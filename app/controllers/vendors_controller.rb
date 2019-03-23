
class VendorsController < ApplicationController
  def vendors_params
    # Allow tags to be created/destroyed along with vendors
    params.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram,
                                   tags_attributes: [:name, :id, :_destroy])
  end
    
  def new
    # Make new vendor so form knows to make submit button say "Create Vendor"
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.create!(vendors_params)
    flash[:message] = "Added Vendor: #{@vendor.name} to Database"
    redirect_to vendors_path
  end

  def index

  end

  def edit
    # Get vendor so form knows to make submit button say "Update Vendor"
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    vendor.update_attributes!(vendors_params)
    flash[:message] = "Updated Vendor: #{vendor.name} to Database"
    redirect_to vendors_path
  end

end
