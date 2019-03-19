require 'rails_helper'
require_relative '../../app/controllers/vendor_controller.rb'

describe VendorController do
	context "add vendor" do
		it "should add a new vendor" do
			new_vendor = FactoryBot.build(:vendor)
		end
	end
end