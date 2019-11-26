"""
Created by CS169 Fall 2019 Team.
"""
class MyVendorsController < ApplicationController
  def index
    @vendors = MyVendor.all
  end

  def indextags
    @vendors = MyVendor.all
  end

  def show
    @vendor = MyVendor.find(params[:id])
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
  
  end
  