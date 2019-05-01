class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

end
