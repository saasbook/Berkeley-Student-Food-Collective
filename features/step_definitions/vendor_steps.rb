Given /I create a new vendor/ do
  FactoryBot.create(:vendor)
end

Given /I fill in the New Vendor form/ do
  FactoryBot.attributes_for(:vendor).each do |key, value|
    step %Q{I fill in "vendor_#{key}" with "#{value}"}
  end
end

When /I add a new tag "(.*)"/ do |tag|
  steps %Q{
  	When I fill in "new_tag_field" with "#{tag}"
		And I press "Add new tag"
	}
end

Then /the DB should be updated with the new vendor/ do 
	steps %Q{
		Then I should be on the All Vendors page
		And I should see "Added Vendor: Default Vendor Name to Database"
	}
end

Then /the new vendor should have the tag "(.*)"/ do |tag|
  step %Q{I am on the Edit Vendor page}
  find('div#tags').should have_content(tag)
end

And /I click "Create Vendor"/ do
	find('input[name="commit"]').click
end

# Then /the DB should not be updated with the new vendor/ do
# 	steps %Q{
# 		Given I am on the All Vendors page
# 		Then I should not see "Added Vendor: New Vendor Name to Database"
# 	}
# end

# Then /a confirm popup should appear/ do
# 	#popup = page.driver.browser.switch_to.alert
# 	accept_confirm do
# 		click_button("cancel_button")
# 	end
# end

Then /I should see the attributes, except tags, filled in/ do
	vendor = Vendor.find_by_name(FactoryBot.attributes_for(:vendor)[:name])
  steps %Q{
  	Then the "vendor[name]" field should contain "#{vendor.name}"
		And the "vendor[description]" field should contain "#{vendor.description}"
		And the "vendor[address]" field should contain "#{vendor.address}"
		And the "vendor[facebook]" field should contain "#{vendor.facebook}"
		And the "vendor[twitter]" field should contain "#{vendor.twitter}"
		And the "vendor[instagram]" field should contain "#{vendor.instagram}"
	}
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