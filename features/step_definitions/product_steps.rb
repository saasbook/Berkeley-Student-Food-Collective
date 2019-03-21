And /I fill in the New Product form/ do 
	steps %Q{
		When I fill in "product_name" with "New Product Name"
	}
end 

Then /the DB should be updated with the new product/ do 
	steps %Q{
		Then I should be on the All Vendors page
		Then I should see "Added Product: New Product Name with Vendor Name: New Vendor Name to Database"
	}
end

And /the vendor is "(.*)"/ do |vendor_name|
	@vendor = vendor_name
end

