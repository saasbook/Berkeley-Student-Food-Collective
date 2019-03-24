Given /I create a new vendor/ do
  FactoryBot.create(:vendor)
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

When /I confirm the popup/ do
  expect{page.driver.browser.switch_to.alert}.not_to raise_error
  page.driver.browser.switch_to.alert.accept
end

When /I dismiss the popup/ do
  expect{page.driver.browser.switch_to.alert}.not_to raise_error
  page.driver.browser.switch_to.alert.dismiss
end

Then /the vendor should( not)? be added/ do |has_not|
	steps %Q{
		Then I should be on the All Vendors page
		And I should #{has_not.nil? ? '' : 'not '}see "Added Vendor: #{FactoryBot.attributes_for(:vendor)[:name]} to Database"
	}
end

Then /the vendor should have the tag "(.*)"/ do |tag|
  step %{I am on the Edit Vendor page}
  within('div#tags') do
    expect(page).to have_selector("input[value='#{tag}']")
  end
end

Then /I should see the attributes(, except "(.*)",)? filled in/ do |exclude|
  FactoryBot.attributes_for(:vendor).each do |key, value|
    if exclude.nil? or key.downcase.to_s != exclude.downcase
      step %{the "vendor[#{key}]" field should contain "#{value}"}
    end
  end
end

Then /I should see the tags filled in/ do
	vendor = Vendor.find_by_name(FactoryBot.attributes_for(:vendor)[:name])
	expected_tags = vendor.tags.pluck(:name)
  actual_tags = find_field("tags[tags]").value
	actual_tags = actual_tags.split(/\s*,\s*/)
  actual_tags.each do |actual_tag|
    expect(expected_tags.include?(actual_tag))
  end
	expect(expected_tags.length == actual_tags.length)
end