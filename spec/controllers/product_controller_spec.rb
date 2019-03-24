require 'rails_helper'
require 'helper'

describe ProductsController do
	describe "New Product Page" do
		it "should show the new product page" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "Add Product Action" do
		it "should add a new product" do 
			#@model_params = ActionController::Parameters.new(product: {:name => "Test Product"})
			#					.require(:product).permit(:name, :vegan, :gluten_free, :dairy_free, :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id)
			@model_params = create_new_product({:name => "Test Product"})
			@new_product = instance_double("Product", :name => "Test Product")
			expect(Product).to receive(:create!).with(@model_params).and_return(@new_product)
			post :create, params: {product: {:name => "Test Product"}}
			expect(response).to redirect_to(products_path)
		end
=begin
		it "should add a new product FactoryBot" do
			vendor = FactoryBot.create(:vendor)
			product = FactoryBot.build(:product)
			product.vendor = vendor
			expect(Product).to receive(:create!).with(create_new_product(product.attributes)).and_return(product)
			post :create, params: {product: product.attributes}

			expect(response).to redirect_to(products_path)
			
		end
=end
		
		it "product was added to the database" do
			expect(Product.all.length == 0)
			vendor = FactoryBot.create(:vendor)
            product = FactoryBot.build(:product)
            product.vendor = vendor
            post :create, params: {:product => product.attributes}
            expect(Product.all.length == 1)
		end
		
	end
end