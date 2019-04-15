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

And /I hover over the second carousel element/ do 
	save_and_open_page
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
	save_and_open_page
	expect(find_by_id("#{type}")).not_to be nil
end