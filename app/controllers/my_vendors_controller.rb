# Created by CS169 Fall 2019 Team.
class MyVendorsController < ApplicationController
  include ControllerVerification


  def index
    @vendors = MyVendor.all
    if Landing.exists?
      @picture = Landing.last.allvendorspicture
    else
      @picture = nil
    end
    if Landing.exists?
      @description = Landing.last.allvendorsdescription
    else
      @description = nil
    end
    render 'my_vendors/index'

  end

  def indextags
    @vendors = MyVendor.all
  end

  def show
    @vendor = MyVendor.find(params[:id])
    @myname = @vendor.name.downcase
    @tags = []
    ProducerTag.all.each do |t|
      if (@vendor.tagslist != nil) && (@vendor.tagslist.downcase.include? t.name.downcase)
        @tags << t.id
      end
    end
    @products = []
    MyProduct.all.each do |prod|
      if (prod.my_vendor_id != nil) && (prod.my_vendor_id == @vendor.id)
        @products << prod.id
      end
    end
  end
  
  def vendor_params
    # ownership_ids allow us to add existing tags (since it's not supported by nested attributes)
    # nested attributes let us add new tags and remove existing ones
    params.require(:my_vendor).permit(:name, :picture, :address, :story, :facebook, :twitter, :instagram, :tagslist)
  end

  def new
    if current_admin
      # Make new vendor so form knows to make submit button say "Create Vendor"
      # Pass in params from form if redirected from #create
      @vendor = MyVendor.new(flash[:prev_params])
      render 'admin+/my_vendors/new'
    else
      redirect_to(my_vendors_path)
    end
  end

  def create
    if current_admin
      # Creates vendor associated with given tags, and creates new tags if necessary
      # Need create and update_attributes call to handle when I add existing tags, but then remove them all
      vendor = MyVendor.create(vendor_params)
      success = vendor.update_attributes(vendor_params)
      vendor.update_attributes(:name => vendor.name.capitalize)
      verify_and_redirect(success, vendor, my_vendors_path, vendor_params)
    end
  end


  def edit
    if current_admin
      # Get vendor so form knows to make submit button say "Update Vendor"
      @vendor = MyVendor.find(params[:id])
      # Pass in params from form if redirected from #update
      if flash[:prev_params]
        @vendor.assign_attributes(flash[:prev_params])
      end
      render "admin+/my_vendors/edit"
    else
      redirect_to(my_vendors_path)
    end
  end

  def update
    if current_admin
      vendor = MyVendor.find(params[:id])
      success = vendor.update_attributes(vendor_params)
      vendor.update_attributes(:name => vendor.name.capitalize)
      verify_and_redirect(success, vendor, my_vendors_path, vendor_params)
    end
  end

  def destroy
    if current_admin
      vendor = MyVendor.find(params[:id])
      success = vendor.destroy
      verify_and_redirect(success, vendor, my_vendors_path, nil)
    end
  end

  def map
  	map_locations = []

  	MyVendor.geocoded.each do |vendor|
  		vendor_info = []
  		vendor_info << vendor.name + "<br>" + vendor.address + "<br>" + "<a href=/my_vendors/" + vendor.id.to_s + ">Vendor Page</a>"
	  	vendor_info << vendor.latitude
	  	vendor_info << vendor.longitude
	  	map_locations << vendor_info
  	end
  	
  	if params[:id] != nil then
  		vendor = MyVendor.find(params[:id])
  		if (vendor.geocoded?) then
			gon.center = {lat: vendor.latitude, lng: vendor.longitude}
  		else
			gon.center = {lat: 37.868490, lng: -122.260410}
  		end
  	else
  		gon.center = {lat: 37.868490, lng: -122.260410}
  	end
  	
  	gon.vendor_list = map_locations
  end


end
  