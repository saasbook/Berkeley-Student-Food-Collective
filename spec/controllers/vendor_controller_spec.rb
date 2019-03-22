require 'rails_helper'
require 'helper'

describe VendorsController do
	describe "New Vendor Page" do
		it "should show the new vendor page" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe "Adding vendor without tags" do
		it "should add a vendor to the DB" do
			expect(Vendor.count).to be(0)
      vendor = FactoryBot.build(:vendor)
      post :create, params: {vendor: vendor.attributes}
			expect(Vendor.count).to be(1)
      expect(Tag.count).to be(0)
      expect(VendorTag.count).to be(0)
      expect(response).to redirect_to(vendors_path)
		end
	end
	
	describe "Adding vendors with tags" do
    before(:each) do
      vendor = FactoryBot.build(:vendor)
      tag = FactoryBot.build(:tag)
      post :create, params: {vendor: vendor.attributes, tags_attributes: {'0': tag.attributes}}
    end

		it "should add a new vendor and tags to the DB" do
      expect(Vendor.count).to be(1)
      expect(Tag.count).to be(1)
      expect(VendorTag.count).to be(1)
    end

    it "should not add duplicate tag to the DB" do
      vendor = FactoryBot.build(:vendor, name: 'Second Vendor')
      tag = FactoryBot.build(:tag)
      post :create, params: {vendor: vendor.attributes, tags_attributes: {'0': tag.attributes}}
      expect(Vendor.count).to be(2)
      expect(Tag.count).to be(1)
      expect(VendorTag.count).to be(2)
    end
  end

  describe "Editing vendor without tags" do
    before(:each) do
      vendor = FactoryBot.build(:vendor)
      post :create, params: {vendor: vendor.attributes}
    end

    it "should edit the vendor in the DB" do
      patch :update, params: {id: Vendor.first.id, vendor: {name: 'Updated Vendor'}}
      expect(Vendor.count).to be(1)
      expect(Vendor.first.name).to be('Updated Vendor')
    end
  end

  describe "Editing vendor with tags" do
    before(:each) do
      vendor = FactoryBot.build(:vendor)
      tag = FactoryBot.build(:tag)
      post :create, params: {vendor: vendor.attributes, tags_attributes: {'0': tag.attributes}}
    end

    it "should edit an existing tag name if the user changes it" do
      expect(Tag.count == 1)
      puts Tag.count
      patch :update, params: {id: Vendor.first.id, vendor: {tags_attributes: {id: 1, name: 'b'}}}
      expect(Tag.first.name).to be('b')
    end
  end
end