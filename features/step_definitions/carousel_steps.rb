Given /I create three new vendors/ do
  FactoryBot.create(:vendor, name: "Fake Name")
  FactoryBot.create(:original_ownership)
  VendorOwnership.create(vendor_id: 1, ownership_id: 1)
  FactoryBot.create(:vendor, name: "Fake Name 2")
  VendorOwnership.create(vendor_id: 2, ownership_id: 1)
  FactoryBot.create(:vendor, name: "Fake Name 3")
  VendorOwnership.create(vendor_id: 3, ownership_id: 1)
end

Given /I create a vendor with a bad picture/ do
  FactoryBot.create(:vendor, name: "Fake Name", picture: "www.google.com")
  FactoryBot.create(:original_ownership)
  VendorOwnership.create(vendor_id: 1, ownership_id: 1)
end

Given /I create three new products/ do
  step %{Given a vendor already exists}
  FactoryBot.create(:product, name: "First Product")
  FactoryBot.create(:product, name: "Second Product")
  FactoryBot.create(:product, name: "Third Product")
  %w(certification nutrition packaging).each do |tag_type|
    @tag_type = FactoryBot.create("original_#{tag_type}")
    "Product#{tag_type.capitalize}".constantize.create(product_id: 1, "#{tag_type}_id": @tag_type.id)
    "Product#{tag_type.capitalize}".constantize.create(product_id: 2, "#{tag_type}_id": @tag_type.id)
    "Product#{tag_type.capitalize}".constantize.create(product_id: 3, "#{tag_type}_id": @tag_type.id)
  end
end

When /I hover over the second carousel element/ do
  find('#Fake_Name_2').hover
end

Then /I should see a carousel for the ownership type "(.*)"/ do |ownership_type|
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

Then /I should see a carousel for the product tag type "(.*)"/ do |tag_type|
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

Then /the left elements should shift to the left/ do
  @classes = find("#Fake_Name")['class'].split(" ")
  expect(@classes).to include("carousel_element")
  expect(@classes).to include("spreadLeft")
end

Then /the right elements should shift to the right/ do
  @classes = find("#Fake_Name_3")['class'].split(" ")
  expect(@classes).to include("carousel_element")
  expect(@classes).to include("spreadRight")
end	

Then /I should see a vendor carousel for (.*)/ do |type|
  expect(find_by_id("#{type}")).not_to be nil
end