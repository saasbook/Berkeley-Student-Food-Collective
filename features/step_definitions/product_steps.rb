Given /a product already exists/ do
  @product = MyProduct.create(my_vendor_id: 1, name: "Apples", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", description: "These are apples")
end

Given /a product tag category already exists/ do
	@productTagCategory = ProductTagCategory.create(name: "Packaging")
end

Given /a product tag already exists/ do
	@productTag = ProductTag.create(product_tag_category_id: 1, name: "Cardboard Box")
end

When /I visit the product detail page/ do
  visit "/my_products/#{@product.id}"
end

Then /I should see the photo and description/ do
  expect(page.find("#image")).not_to be nil
  expect(page.find("#description")).not_to be nil
end

Given /I visit the new product form/ do
  visit('my_products/new?')
end


