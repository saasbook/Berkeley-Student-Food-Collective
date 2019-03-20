And /I fill in the New Vendor form/ do 
	steps %Q{
		When I fill in "name" with "New Vendor Name"
		When I fill in "address" with "Fake Address"
		When I fill in "facebook" with "Fake Facebook"
		When I fill in "twitter" with "Fake Twitter"
		When I fill in "instagram" with "Fake Instagram"
	}
end 

Then /the DB should be updated with the new vendor/ do 
	steps %Q{
		Given I am on "All Vendors Page"
		Then I should see "Added Vendor: New Vendor Name to Database"
	}
end

Then /the DB should not be updated with the new vendor/ do 
	step %Q{
		Given I am on "All Vendors Page"
		Then I should not see "Added Vendor: New Vendor Name to Database"
	}
end

