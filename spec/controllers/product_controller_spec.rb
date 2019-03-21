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
			#@model_params = ActionController::Parameters.new(vendor: {:name => "Test Vendor", :description => "Test Description"})
			#					.require(:vendor).permit(:name, :description, :address, :facebook, :twitter, :instagram)
			@model_params = create_new_product({:name => "Test Product"})
			@new_product = instance_double("Product", :name => "Test Vendor")
			expect(Product).to receive(:create!).with(@model_params).and_return(@new_product)
			post :create, params: {product: {:name => "Test Product"}}

			expect(response).to redirect_to(products_path)
		end
		it "product was added to the database" do
			expect(Product.all.length == 0)
            product = FactoryBot.build(:product)
            puts product.attributes
            post :create, params: {:product => product.attributes}
            expect(Product.all.length == 1)
		end
		
	end
end