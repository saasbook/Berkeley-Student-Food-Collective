Given /I create a new product/ do
  FactoryBot.create(:product)
end

When /I fill in the New Product form( except Vendor)?/ do |exclude_vendor|
  step %{I am on the New Product page}
  vendor_name = Vendor.first.name
  product_attributes = FactoryBot.attributes_for(:product)
  unless exclude_vendor
    step %{I select "#{vendor_name}" from "product_vendor_id"}
  end
  steps %Q{
    Then I fill in "Name" with "#{product_attributes[:name]}"
    And I fill in "UPC" with "#{product_attributes[:upc]}"
  }
  product_attributes.each do |key, value|
    unless [:name, :vendor_id, :upc].include?(key)
      step %{I #{value ? '' : 'un'}check "product_#{key}"}
    end
  end
end

Then /the product should( not)? be (.*)/ do |has_not, action|
  steps %Q{
		Then I should be on the All Products page
		And I should #{has_not.nil? ? '' : 'not '}see "#{action.capitalize} Product"
	}
end

Then /I should see the product attributes(, except "(.*)",)? filled in/ do |exclude|
  exclude = exclude.downcase unless exclude.nil?
  product_attributes = FactoryBot.attributes_for(:product)
  # TODO: Check selected vendor name as well?
  if exclude != "name"
    step %{the "Name" field should contain "#{product_attributes[:name]}"}
  end
  if exclude != "upc"
    step %{the "UPC" field should contain "#{product_attributes[:upc]}"}
  end
  product_attributes.each do |key, value|
    if not [:name, :vendor_id, :upc].include?(key) and exclude != key
      step %{the "product_#{key}" checkbox should #{value ? '' : 'not '}be checked}
    end
  end
end