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

