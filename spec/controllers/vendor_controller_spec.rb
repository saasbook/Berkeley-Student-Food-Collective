require 'rails_helper'
#require_relative '../../app/controllers/vendors_controller.rb'

describe VendorsController do
	describe "New Vendor Page" do
		it "should show the new page" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "Add Vendor without Tags Action" do
		it "should add a new vendor" do 
			new_vendor = instance_double("Vendor", :name => "Test Vendor", :description => "Test Description")
			expect(Vendor).to receive(:create).with(params: {:vendor => {:name => "Test Vendor", :description => "Test Description"}}).and_return(new_vendor)
			post :create, params: {:vendor => {:name => "Test Vendor", :description => "Test Description"}}
		end
	end
end