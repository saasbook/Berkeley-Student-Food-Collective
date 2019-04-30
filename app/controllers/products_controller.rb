class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    
    @product.tags = @product.certifications + @product.nutritions + @product.packagings
    @product.rfc = []
    if @product.lc_based
    	@product.rfc.append(:lc_based)
    end
    if @product.fair
    	@product.rfc.append(:fair)
    end
    if @product.eco_sound
    	@product.rfc.append(:eco_sound)
    end
    if @product.humane
    	@product.rfc.append(:humane)
    end
  end

end
