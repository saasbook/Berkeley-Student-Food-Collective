"""
Created by CS169 Fall 2019 Team.
"""
class MyVendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end
  
  end
  