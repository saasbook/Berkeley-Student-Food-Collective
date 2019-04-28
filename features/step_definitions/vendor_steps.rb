Given /a vendor already exists/ do
  FactoryBot.create(:vendor)
end

Given /a(?:nother)? vendor tag already exists/ do
  FactoryBot.create(:ownership)
end

Given /a vendor with a tag already exists/ do
  @vendor = FactoryBot.create(:vendor)
  @ownership = FactoryBot.create(:original_ownership)
  VendorOwnership.create(vendor_id: @vendor.id, ownership_id: @ownership.id)
end

Given /another vendor already exists/ do
  FactoryBot.create(:vendor, name: FactoryBot.attributes_for(:other_vendor)[:name])
end

When /I fill in the new vendor form/ do
  step %{I go to the new vendor page}
  FactoryBot.attributes_for(:vendor).each do |key, value|
    fill_in "vendor_#{key}", with: value
  end
end

When /I add a pre-existing vendor tag/ do
  select FactoryBot.attributes_for(:ownership)[:name], from: :existing_ownerships
  click_button 'Add existing ownership type'
  step %{the vendor should have a pre-existing tag}
end


When /I add a new vendor tag/ do
  fill_in 'new_ownership_field', with: FactoryBot.attributes_for(:new_ownership)[:name]
  click_button 'Add new ownership type'
  step %{the vendor should have a new tag}
end

When /I add a new blank vendor tag/ do
  click_button 'Add new ownership type'
end

When /I fill in "Name" with the other vendor's name/ do
  fill_in :Name, with: FactoryBot.attributes_for(:other_vendor)[:name]
end

When /I remove the pre-existing vendor tag/ do
  input = page.find('#ownerships').find("input[value='#{FactoryBot.attributes_for(:ownership)[:name]}']")
  input.sibling('input[type="checkbox"]').check
end

When /I remove the new vendor tag/ do
  input = page.find('#ownerships').find("input[value='#{FactoryBot.attributes_for(:new_ownership)[:name]}']")
  input.sibling('input[type="checkbox"]').check
end

Then /the vendor should be successfully added/ do
  steps %Q{
    Then I should be on the volunteer-facing vendors index page
    And I should see a success message
    And I go to the edit vendor page
    And I should see the vendor attributes filled in
  }
end

Then /the vendor should be successfully updated/ do
  steps %Q{
    Then I should be on the volunteer-facing vendors index page
    And I should see a success message
    And I go to the edit vendor page
  }
end


Then /I should see the vendor attributes(, except "(.*)",)? filled in/ do |exclude|
  FactoryBot.attributes_for(:vendor).each do |key, value|
    if exclude.nil? or key.downcase.to_s != exclude.downcase
      step %{the "vendor[#{key}]" field should contain "#{value}"}
    end
  end
end

Then /the vendor should have a pre-existing tag/ do
  expect(page.find('#ownerships')).to have_selector("input[value='#{FactoryBot.attributes_for(:ownership)[:name]}']")
end

Then /the vendor should have a new tag/ do
  expect(page.find('#ownerships')).to have_selector("input[value='#{FactoryBot.attributes_for(:new_ownership)[:name]}']")
end

Then /the vendor should have its original tag/ do
  expect(page.find('#ownerships')).to have_selector("input[value='#{FactoryBot.attributes_for(:original_ownership)[:name]}']")
end

Then /the vendor should have no tags/ do
  div = page.find('#ownerships')
  expect(div).not_to have_selector("input[value='#{FactoryBot.attributes_for(:ownership)[:name]}']")
  expect(div).not_to have_selector("input[value='#{FactoryBot.attributes_for(:new_ownership)[:name]}']")
  expect(div).not_to have_selector("input[value='#{FactoryBot.attributes_for(:original_ownership)[:name]}']")
end

Then /no vendors should exist/ do
  expect(Vendor.count).to eq(0)
end
