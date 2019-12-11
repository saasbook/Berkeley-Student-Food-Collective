Then /I should see no pins on the map/ do
  expect(page).to have_selector('#markers img', count: 0)
end

Given /that there is one vendor created with location "San Francisco, California"/ do
  @vendor = MyVendor.new(name: "Vendor1", picture: "https://media.wired.com/photos/598e35994ab8482c0d6946e0/master/w_2560%2Cc_limit/phonepicutres-TA.jpg", address: "San Francisco, California")
  @vendor.save
end

Then /I should see one pin on the map/ do
  expect(page).to have_selector('#markers img', count: 1)
end