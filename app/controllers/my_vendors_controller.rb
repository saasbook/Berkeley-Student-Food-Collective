# Created by CS169 Fall 2019 Team.

class MyVendorsController < ApplicationController
  def index
    @vendors = MyVendor.all
    if Landing.exists?
      @picture = Landing.last.allvendorspicture
      @description = Landing.last.allvendorsdescription
    else
      @picture = nil
      @description = nil
    end

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
  end
  
  def vendor_params
    # ownership_ids allow us to add existing tags (since it's not supported by nested attributes)
    # nested attributes let us add new tags and remove existing ones
    params.require(:my_vendor).permit(:name, :picture, :story, :mission, :description, :address, :facebook, :twitter, :instagram, :tagslist)
  end

  def vendor_params_without_nested
    vendor_params.except(:ownerships_attributes)
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
      vendor = MyVendor.create(vendor_params_without_nested)
      success = vendor.update_attributes(vendor_params)
      verify_and_redirect(success, vendor, my_vendors_path, vendor_params)
    else 
      redirect_to(my_vendors_path)
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
      redirect_to(my_vendors_path) && return
    end
  end

  def update
    if current_admin
      vendor = MyVendor.find(params[:id])
      success = vendor.update_attributes(vendor_params)
      verify_and_redirect(success, vendor, my_vendors_path, vendor_params)
    else
      redirect_to(my_vendors_path)
    end
  end

  def destroy
    if current_admin
      vendor = MyVendor.find(params[:id])
      success = vendor.destroy
      verify_and_redirect(success, vendor, my_vendors_path, nil)
    else 
      redirect_to(my_vendors_path)
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
  	
  	gon.vendor_list = map_locations
  end

  def verify_and_redirect(success, item, index_page, params)
    if success
      flash[:message] = 'Success!'
      flash[:type] = 'alert alert-success'
      redirect_to index_page
    else
      flash[:message] = item.errors.full_messages
      flash[:type] = 'alert alert-danger'
      flash[:prev_params] = params
      redirect_back(fallback_location: index_page)
    end
  end

end
  