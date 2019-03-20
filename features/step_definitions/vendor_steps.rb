And /I fill in the "New Vendor Form"/ do 
	step %Q{
		When I fill in "name" with "New Vendor Name"
		When I fill in "address" with "Fake Address"
		When I fill in "facebook" with "Fake Facebook"
		When I fill in "twitter" with "Fake Twitter"
		When I fill in "instagram" with "Fake Instagram"
	}
end 

Then /the DB should be updated with the new vendor/ do 
	step %Q{
		Given I am on "All Vendors Page"
		Then I should see "Added New Vendor"
	}
end

Then /the DB should not be updated with the new vendor/ do 
	step %Q{
		Given I am on "All Vendors Page"
		Then I should not see "New Vendor Name"
	}
end

