class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    @tags = @product.certifications + @product.nutritions + @product.packagings
    @rfc = []
    if @product.lc_based
    	@rfc.append("Locally based")
    end
    if @product.fair
    	@rfc.append("Fairly traded")
    end
    if @product.eco_sound
    	@rfc.append("Ecologically Sound")
    end
    if @product.humane
    	@rfc.append("Humane")
    end
  end

end
