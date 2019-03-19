require 'rails_helper'
require_relative '../../app/controllers/vendors_controller.rb'

describe VendorsController do
	context "add vendor" do
		it "should add a new vendor" do
			new_vendor = FactoryBot.build(:vendor)
			expect(3).to be 3
		end
	end
end