And /I fill in the New Vendor form/ do 
	steps %Q{
		When I fill in "product_name" with "New Product Name"
		When I select "New Vendor Name" from "vendorDropdown"
	}
end 

Then /the DB should be updated with the new product/ do 
	steps %Q{
		Then I should be on the All Vendors page
		Then I should see "Added Product: New Product Name to Database"
	}
end

And /the vendor is "(.*)"/ do |vendor_name|
	@vendor = vendor_name
end

