"""
Created by CS169 Fall 2019 Team.
"""
class MyProductsController < ApplicationController

  def index
    @products = MyProduct.all
  end

  def show
    @product = MyProduct.find(params[:id])
    @tags = @product.product_tags
    render 
  end
  
  end
  