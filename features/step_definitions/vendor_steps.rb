Given /I create a new vendor/ do
  FactoryBot.create(:vendor)
end

And /I fill in the New Vendor form/ do
	steps %Q{
		When I fill in "vendor_name" with "New Vendor Name"
		When I fill in "vendor_address" with "Fake Address"
		When I fill in "vendor_facebook" with "Fake Facebook"
		When I fill in "vendor_twitter" with "Fake Twitter"
		When I fill in "vendor_instagram" with "Fake Instagram"
	}
end 

Then /the DB should be updated with the new vendor/ do 
	steps %Q{
		Then I should be on the All Vendors page
		Then I should see "Added Vendor: New Vendor Name to Database"
	}
end

Then /the DB should not be updated with the new vendor/ do 
	steps %Q{
		Given I am on the All Vendors page
		Then I should not see "Added Vendor: New Vendor Name to Database"
	}
end

When /I click "cancel_button"/ do

end

Then /a confirm popup should appear/ do
	#popup = page.driver.browser.switch_to.alert
	accept_confirm do
		click_button("cancel_button")
	end
end

Then /I should see the attributes, except tags, filled in/ do
	vendor = Vendor.find_by_name(FactoryBot.attributes_for(:vendor)[:name])
  steps %Q{
  	Then the "vendor[name]" field should contain "#{vendor.name}"
		Then the "vendor[description]" field should contain "#{vendor.description}"
		Then the "vendor[address]" field should contain "#{vendor.address}"
		Then the "vendor[facebook]" field should contain "#{vendor.facebook}"
		Then the "vendor[twitter]" field should contain "#{vendor.twitter}"
		Then the "vendor[instagram]" field should contain "#{vendor.instagram}"
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