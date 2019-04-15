Given /I create three new vendors/ do
	steps %{
		Given a first vendor with a tag already exists
		Given a second vendor with a tag already exists
		Given a third vendor with a tag already exists
	}
end

Given /a first vendor with a tag already exists/ do
	FactoryBot.create(:vendor, name: "Fake Name")
   	FactoryBot.create(:original_ownership)
  	VendorOwnership.create(vendor_id: 1, ownership_id: 1)
end

Given /a second vendor with a tag already exists/ do
   	FactoryBot.create(:vendor, name: "Fake Name 2")
   	FactoryBot.create(:original_ownership)
  	VendorOwnership.create(vendor_id: 2, ownership_id: 2)
end

Given /a third vendor with a tag already exists/ do
   	FactoryBot.create(:vendor, name: "Fake Name 3")
   	FactoryBot.create(:original_ownership)
  	VendorOwnership.create(vendor_id: 3, ownership_id: 3)
end




Given /I create three new products/ do
	steps %{
		Given a vendor already exists
		Given a first product with a tag already exists
		Given a second product with a tag already exists
		Given a third product with a tag already exists
	}
end

Given /a first product with a tag already exists/ do
	FactoryBot.create(:product, name: "First Product")
  	%w(certification nutrition packaging).each do |tag_type|
    	FactoryBot.create("original_#{tag_type}")
    	"Product#{tag_type.capitalize}".constantize.create(product_id: 1, "#{tag_type}_id": 1)
  	end
end


Given /a second product with a tag already exists/ do
   	FactoryBot.create(:product, name: "Second Product")
  	%w(certification nutrition packaging).each do |tag_type|
    	FactoryBot.create("original_#{tag_type}")
    	"Product#{tag_type.capitalize}".constantize.create(product_id: 2, "#{tag_type}_id": 2)
  	end
end


Given /a third product with a tag already exists/ do
   	FactoryBot.create(:product, name: "Third Product")
  	%w(certification nutrition packaging).each do |tag_type|
    	FactoryBot.create("original_#{tag_type}")
    	"Product#{tag_type.capitalize}".constantize.create(product_id: 3, "#{tag_type}_id": 3)
  	end
end




 
And /I see a carousel for the ownership type "(.*)"/ do |ownership_type| 
	@formatted = ownership_type.gsub(' ', '_')
	@found = find("##{@formatted}")
	expect(@found).not_to be(nil)
end

Then /I should see all vendors with owned by "(.*)"/ do |ownership_type|
	@count = 3
	@classes = ".container.carousel_element." + ownership_type.gsub(" ", "_")
	@all_vendors = page.all(:css, @classes)
	expect(@all_vendors.length).to be(@count)
end

And /I see a carousel for the product tag type "(.*)"/ do |tag_type|
	@formatted = tag_type.gsub(' ', '_')
	@found = find("##{@formatted}")
	expect(@found).not_to be(nil)
end


Then /I should see all products with the tag "(.*)"/ do |tag_type|
	@count = 3
	@classes = ".container.carousel_element." + tag_type.gsub(" ", "_")
	@all_vendors = page.all(:css, @classes)
	expect(@all_vendors.length).to be(@count)
end





And /I hover over the second carousel element/ do 
	find('#Fake_Name_2').hover
end

Then /the left elements should shift to the left/ do
	@classes = find("#Fake_Name")['class'].split(" ")
	expect(@classes).to include("carousel_element")
	expect(@classes).to include("spreadLeft")
end

And /the right elements should shift to the right/ do
	@classes = find("#Fake_Name_3")['class'].split(" ")
	expect(@classes).to include("carousel_element")
	expect(@classes).to include("spreadRight")
end	

Then /I should see a vendor carousel for (.*)/ do |type|
	expect(find_by_id("#{type}")).not_to be nil
end