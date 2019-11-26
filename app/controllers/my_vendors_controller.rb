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
  
  end
  