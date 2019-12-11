Given /I visit the new tag category form/ do
  visit "/product_tag_categories/new?"
end

Then /I should see the new tag category page/ do
  visit "/product_tag_categories/new?"
end

And /I should see the tag category attributes filled in/ do
  find("#vendors_body")
end

Given /I am on the new vendor form/ do
  visit "/my_vendors/#{@vendor.id}"
end

Given /I am on the new vendor edit form/ do

  visit "/my_vendors/#{@vendor.id}/edit"
end

Given /I visit the new vendor form/ do
  visit "/my_vendors/new?"
end

Then /I stay on the new vendor form/ do
  visit "/my_vendors/new?"
end

And /I should see the new vendors attributes filled in/ do
  find("#vendors_body")
end

Given /I visit the new producer tag form/ do
  visit('/producer_tags/new?')
end

Then /I should see the new producer tag page/ do
  visit('/producer_tags/new?')
end

Given /I visit the new product tag form/ do
  visit('/product_tags/new?')
end

Then /I should see the new product tag page/ do
  visit('/product_tags/new?')
end