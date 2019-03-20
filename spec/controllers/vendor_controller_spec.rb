require 'rails_helper'
#require_relative '../../app/controllers/vendors_controller.rb'

describe VendorsController do
	describe "New Vendor Page" do
		it "should show the new page" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "Add Vendor Action" do
		it "should add a new vendor" do 
			#ew_vendor = FactoryBot.build(:vendor, :name => "Test Vendor", :description => "Test Description")

		end
	end
end