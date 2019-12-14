Given /a vendor already exists/ do
  @vendor = MyVendor.create(name: "Vendor1", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", story: "These are apples")
end

Given /I am looking at a vendor page with a valid address/ do
  @vendor = MyVendor.new(name: 'Vendor1',
                         picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528',
                         story: 'These are apples',
                         facebook: 'https://www.facebook.com/',
                         twitter: 'https://www.facebook.com/',
                         instagram: 'https://www.facebook.com/',
                         address: '3254 Adeline St., Berkeley, CA 94703')
  @vendor.save
  visit "/my_vendors/#{@vendor.id}"
end

Given /I am looking at a vendor page with an invalid address/ do
  @vendor = MyVendor.new(name: 'Vendor1',
                         picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528',
                         story: 'These are apples',
                         facebook: 'https://www.facebook.com/',
                         twitter: 'https://www.facebook.com/',
                         instagram: 'https://www.facebook.com/',
                         address: 'arglbrgr')
  @vendor.save
  visit "/my_vendors/#{@vendor.id}"
end

When /I visit the vendor detail page/ do
  @vendor = MyVendor.new(name: 'Vendor1',
                         picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528',
                         story: 'These are apples',
                         facebook: 'https://www.facebook.com/',
                         twitter: 'https://www.facebook.com/',
                         instagram: 'https://www.facebook.com/')
  visit "/my_vendors/#{@vendor.id}"
end

Then /I should see the photo and story of the vendor/ do
  expect(page.find("#image")).not_to be nil
  expect(page.find("#story")).not_to be nil
end


Then /I should see the vendor attributes(, except "(.*)",)? filled in/ do |exclude|
  FactoryBot.attributes_for(:vendor).each do |key, value|
    if exclude.nil? or key.downcase.to_s != exclude.downcase
      step %{the "vendor[#{key}]" field should contain "#{value}"}
    end
  end
end


Then /no vendors should exist/ do
  expect(Vendor.count).to eq(0)
end


Then /I am redirected to the vendor detail page/ do
  visit "/my_vendors/"
end


