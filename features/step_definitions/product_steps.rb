Given /(?:other )?product tags already exist/ do
  FactoryBot.create(:certification)
  FactoryBot.create(:nutrition)
  FactoryBot.create(:packaging)
end

Given /a product already exists/ do
  FactoryBot.create(:product)
end

Given /a product with tags already exists/ do
  FactoryBot.create(:product)
  %w(certification nutrition packaging).each do |tag_type|
    @new_tag = FactoryBot.create("original_#{tag_type}")
    "Product#{tag_type.capitalize}".constantize.create(product_id: 1, "#{tag_type}_id": @new_tag.id)
  end
end

When /I fill in the new product form( except the vendor field)?/ do |exclude_vendor|
  step %{I am on the new product page}
  vendor_name = Vendor.first.name
  product_attributes = FactoryBot.attributes_for(:product)
  unless exclude_vendor
    select vendor_name, from: :product_vendor_id
  end
  fill_in :Name, with: product_attributes[:name]
  fill_in :UPC, with: product_attributes[:upc]
  fill_in :Picture, with: product_attributes[:picture]
  fill_in :Origin, with: product_attributes[:origin]
  product_attributes.each do |key, value|
    unless [:name, :vendor_id, :upc, :picture, :origin, :cultural_history].include?(key)
      step %{I #{value ? '' : 'un'}check "product_#{key}"}
    end
  end
end

When /I add pre-existing product tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    select FactoryBot.attributes_for(tag_type)[:name], from: "existing_#{tag_type}s"
    click_button "Add existing #{tag_type} type"
  end
  step %{the product should have pre-existing tags}
end

When /I add new product tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    fill_in "new_#{tag_type}_field", with: FactoryBot.attributes_for("new_#{tag_type}")[:name]
    click_button "Add new #{tag_type} type"
  end
  step %{the product should have new tags}
end

When /I add new blank product tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    click_button "Add new #{tag_type} type"
  end
end

When /I select the product's vendor as the other vendor/ do
  select FactoryBot.attributes_for(:other_vendor)[:name], from: :product_vendor_id
end

When /I remove the pre-existing product tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    input = page.find("##{tag_type}s").find("input[value='#{FactoryBot.attributes_for(tag_type)[:name]}']")
    input.sibling('input[type="checkbox"]').check
  end
end

When /I remove the new product tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    input = page.find("##{tag_type}s").find("input[value='#{FactoryBot.attributes_for("new_#{tag_type}")[:name]}']")
    input.sibling('input[type="checkbox"]').check
  end
end

When /I remove the original product tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    input = page.find("##{tag_type}s").find("input[value='#{FactoryBot.attributes_for("original_#{tag_type}")[:name]}']")
    input.sibling('input[type="checkbox"]').check
  end
end

When /I click on the vendor name/ do
  page.find(".vendorName").click
end

Then /the product should be successfully added/ do
  steps %Q{
    Then I should be on the volunteer-facing products index page
    And I should see a success message
    And I go to the edit product page
    And I should see the product attributes filled in
  }
end

Then /the product should be successfully updated/ do
  steps %Q{
    Then I should be on the volunteer-facing products index page
    And I should see a success message
    And I go to the edit product page
  }
end

Then /I should see the product attributes(, except "(.*)",)? filled in/ do |exclude|
  product_attributes = FactoryBot.attributes_for(:product)
  unless exclude == 'vendor'
    expect(page).to have_select('Select a Vendor', selected: FactoryBot.attributes_for(:vendor)[:name])
  end
  unless exclude == 'name'
    step %{the "Name" field should contain "#{product_attributes[:name]}"}
  end
  step %{the "UPC" field should contain "#{product_attributes[:upc]}"}
  unless exclude == 'picture'
    step %{the "Picture" field should contain "#{product_attributes[:picture]}"}
  end
  unless exclude == 'origin'
    step %{the "Origin" field should contain "#{product_attributes[:origin]}"}
  end
  product_attributes.each do |key, value|
    if not [:name, :vendor_id, :upc, :picture, :origin, :cultural_history].include?(key) and exclude != key
      step %{the "product_#{key}" checkbox should #{value ? '' : 'not '}be checked}
    end
  end
end

Then /the product should have pre-existing tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    expect(page.find("##{tag_type}s")).to have_selector("input[value='#{FactoryBot.attributes_for(tag_type)[:name]}']")
  end
end

Then /the product should have new tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    expect(page.find("##{tag_type}s")).to have_selector("input[value='#{FactoryBot.attributes_for("new_#{tag_type}")[:name]}']")
  end
end

Then /the product should have its original tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    expect(page.find("##{tag_type}s")).to have_selector("input[value='#{FactoryBot.attributes_for("original_#{tag_type}")[:name]}']")
    #expect(page.find("##{tag_type}s")).to have_css("input", :text => '#{FactoryBot.attributes_for("original_#{tag_type}")[:name]}')
  end
end

Then /the product should have no tags/ do
  %w(certification nutrition packaging).each do |tag_type|
    div = page.find("##{tag_type}s")
    expect(div).not_to have_content(FactoryBot.attributes_for(tag_type)[:name])
    expect(div).not_to have_content(FactoryBot.attributes_for("new_#{tag_type}")[:name])
    expect(div).not_to have_content(FactoryBot.attributes_for("original_#{tag_type}")[:name])
  end
end

Then /I should see the vendor, photo, origin, cultural history and tags of the product/ do
  expect(page.find(".vendorName")).not_to be nil
  expect(page.find("#detailsPageImage")).not_to be nil
  expect(page.find(".origintext")).not_to be nil
  expect(page.find(".subheadtext")).not_to be nil

  product_attributes = FactoryBot.attributes_for(:product)
  rfcDiv = page.find("#tags")
  if product_attributes[:lc_based]
    rfcDiv.should have_content "Locally based"
  else
    rfcDiv.should_not have_content "Locally based"
  end
  if product_attributes[:fair]
    rfcDiv.should have_content "Fairly traded"
  else
    rfcDiv.should_not have_content "Fairly traded"
  end
  if product_attributes[:eco_sound]
    rfcDiv.should have_content "Ecologically Sound"
  else
    rfcDiv.should_not have_content "Ecologically Sound"
  end
  if product_attributes[:humane]
    rfcDiv.should have_content "Humane"
  else
    rfcDiv.should_not have_content "Humane"
  end

  dietaryRestrictionsDiv = page.find("#dietaryRestrictionsFullContent")
  if product_attributes[:vegan] or product_attributes[:gluten_free] or product_attributes[:dairy_free]
    expect(dietaryRestrictionsDiv.find("#dietaryLogo")).not_to be nil
  else
    expect(dietaryRestrictionsDiv.find("#dietaryLogo")).to be nil
  end
end

Then /^(?:|I )should navigate to (.+)$/ do |page_name|
  expect(page.find('.vendorName')['onclick']).to include path_to(page_name)
end

Then /the product's vendor should be the other vendor/ do
  expect(page).to have_select('Select a Vendor', selected: FactoryBot.attributes_for(:other_vendor)[:name])
end

Then /no products should exist/ do
  expect(Product.count).to eq(0)
end
