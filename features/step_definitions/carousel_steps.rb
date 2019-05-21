Given /I create (.*) new vendors/ do |num|
  i = 1
  @ownership = FactoryBot.create(:original_ownership)

  num.to_i.times do
    @name = "Fake Name"
    @vendor = FactoryBot.create(:vendor, name: "Fake Name #{i.to_s}")
    VendorOwnership.create(vendor_id: @vendor.id, ownership_id: @ownership.id)
    i += 1
  end
end

Given /I create (.*) new photo-less vendors/ do |num|
  i = 1
  @ownership = FactoryBot.create(:original_ownership)

  num.to_i.times do
    @name = "Fake Name"
    @vendor = FactoryBot.create(:vendor, name: "Fake Name #{i.to_s}")
    VendorOwnership.create(vendor_id: @vendor.id, ownership_id: @ownership.id)
    @vendor[:picture] = ''
    @vendor.save!
    i += 1
  end
end

Given /I create a vendor with a bad picture/ do
  FactoryBot.create(:vendor, name: "Fake Name", picture: "www.google.com")
  FactoryBot.create(:original_ownership)
  VendorOwnership.create(vendor_id: 1, ownership_id: 1)
end

Given /I create (.*) new products/ do |num|
  step %{Given a vendor already exists}

  @products = []
  i = 0
  num.to_i.times do
    @product =FactoryBot.create(:product, name: "Product #{i.to_s}")
    @products << @product
  end

  %w(certification nutrition packaging).each do |tag_type|
    @tag_type = FactoryBot.create("original_#{tag_type}")
    @products.each do |product|
      "Product#{tag_type.capitalize}".constantize.create(product_id: product.id, "#{tag_type}_id": @tag_type.id)
    end
  end
end

Given /I create (.*) new photo-less products/ do |num|
  step %{Given a vendor already exists}

  @products = []
  i = 0
  num.to_i.times do
    @product =FactoryBot.create(:product, name: "Product #{i.to_s}")
    @product[:picture] = ''
    @product.save!
    @products << @product
  end

  %w(certification nutrition packaging).each do |tag_type|
    @tag_type = FactoryBot.create("original_#{tag_type}")
    @products.each do |product|
      "Product#{tag_type.capitalize}".constantize.create(product_id: product.id, "#{tag_type}_id": @tag_type.id)
    end
  end
end

Then /I should see a carousel for the ownership type "(.*)"/ do |ownership_type|
  @formatted = ownership_type.downcase.gsub(' ', '_')
  expect(page).not_to have_select("##{@formatted}")
end

Then /I should not see a carousel for the ownership type "(.*)"/ do |ownership_type|
  @formatted = ownership_type.gsub(' ', '_')
  expect(page).not_to have_selector("##{@formatted}")
end

Then /I should not see a carousel for the type "(.*)"/ do |nutrition_or_rfc_type|
  @formatted = nutrition_or_rfc_type.gsub(' ', '_')
  expect(page).not_to have_selector("##{@formatted}")
end


Then /I should see (.*) vendors with owned by "(.*)"/ do |count, ownership_type|
  @classes = ".container.carousel_element." + ownership_type.downcase.gsub(" ", "_")
  @all_vendors = page.all(:css, @classes)
  expect(@all_vendors.length).to eq(count.to_i)
end

Then /I should see a carousel for the product tag type "(.*)"/ do |tag_type|
  @formatted = tag_type.downcase.gsub(' ', '_')
  @found = find("##{@formatted}")
  expect(@found).not_to be(nil)
end

Then /I should see (.*) products with the tag "(.*)"/ do |num, tag_type|
  @count = num.to_i
  @classes = ".container.carousel_element." + tag_type.downcase.gsub(" ", "_")
  @all_vendors = page.all(:css, @classes)
  expect(@all_vendors.length).to be(@count)
end

Then /I should see a vendor carousel for (.*)/ do |type|
  expect(find_by_id("#{type}")).not_to be nil
end
