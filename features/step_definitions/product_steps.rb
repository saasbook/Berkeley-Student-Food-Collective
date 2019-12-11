Given /a product already exists/ do
  @product = MyProduct.new(my_vendor_id: 1, name: "Apples", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", description: "These are apples")
end

Given /a vendor already exists/ do
  @vendor = MyVendor.new(name: "Vendor1", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", story: "These are apples")
end

When /I visit the product detail page/ do
  visit "/my_products/#{@product.id}"
end

Then /I should see the photo and description/ do
  expect(page.find("#image")).not_to be nil
  expect(page.find("#story")).not_to be nil
end


And /product tags already exist/ do

end

And /I fill in the new product form/ do

end

