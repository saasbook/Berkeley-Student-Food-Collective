
Given /I create a new vendor with tags/ do
  FactoryBot.create(:vendor)
  FactoryBot.create(:tag)
  VendorTag.create(tag_id: 1, vendor_id: 1)
end

Given /I create a new vendor with name of "(.*)"/ do |name|
  FactoryBot.create(:vendor, name: name)
end

When /I fill in the New Vendor form/ do
  step %{I am on the New Vendor page}
  FactoryBot.attributes_for(:vendor).each do |key, value|
    step %{I fill in "vendor_#{key}" with "#{value}"}
  end
end

When /I add a new tag "(.*)"/ do |tag|
  steps %Q{
  	When I fill in "new_tag_field" with "#{tag}"
		And I press "Add new tag"
	}
end

Then /the vendor should( not)? be (.*)/ do |has_not, action|
	steps %Q{
		Then I should be on the All Vendors page
		And I should #{has_not.nil? ? '' : 'not '}see "#{action.capitalize} Vendor"
	}
end

Then /I should see the vendor attributes(, except "(.*)",)? filled in/ do |exclude|
  FactoryBot.attributes_for(:vendor).each do |key, value|
    if exclude.nil? or key.downcase.to_s != exclude.downcase
      step %{the "vendor[#{key}]" field should contain "#{value}"}
    end
  end
end

Then /the vendor should have the tag "(.*)"/ do |tag|
  step %{I am on the Edit Vendor page}
  within('div#tags') do
    expect(page).to have_selector("input[value='#{tag}']")
  end
end

Then /the vendor should have no tags/ do
  step %{I am on the Edit Vendor page}
  expect(page.all('.tag').length).to eq(0)
end

Then /I should see the tags filled in/ do
	expected_tags = Vendor.find(1).tags.pluck(:name)
  actual_tags = page.all('.tag')
  expect(expected_tags.length == actual_tags.length)
  actual_tags.each do |actual_tag|
    within(actual_tag) do
      expect(expected_tags).to include(page.find('input[type="text"]').value)
    end
  end
end
