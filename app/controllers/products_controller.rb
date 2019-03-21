class ProductsController < ApplicationController
	def product_params
		params.require(:product).permit(:name, :vegan, :gluten_free, :dairy_free, :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id)
	end
	def new
		#route to new.html.haml
	end

	def create
		@product = Product.create!(product_params)
        flash[:message] = "Added Product: #{@product.name} to Database"
        redirect_to products_path
	end

	def index
		#redirect to index.html.haml
	end


end
