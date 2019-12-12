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

Given /I am logged in as an admin/ do
  steps %{
    Given I am not logged in
    Given there are no admin accounts exists
    Then I go to The Admins Control page
    When I press "Add New Admin"
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I fill in "Password confirmation" with "123"
    When I press "Create Admin"
    Then I go to the Discovery page
    When I press "Login"
    Then I am on the Admin Welcome page
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I should be on the Discovery page
    And I should see "ADMIN"
  }
end

And /A producer tag exist/ do
  @producer_tag = ProducerTag.new(name: "Producer Tag", picture: "https://media2.s-nbcnews.com/j/newscms/2018_20/1339477/puppy-cute-today-180515-main_a936531048fdb698635dd1b418abdee9.fit-760w.jpg", description: "Hello")

end

When /I visit a specific producer tag/ do
  visit("producer_tags/#{@producer_tag.id}")
end

Then /I should see an edit button/ do
  expect(page.should have_selector('a')).not_to be nil
end


Then /I should see the edit form/ do
  find('#vendors_body')
end

And /I click the Edit Previous button/ do
  click_link('Edit Previous')
end

And /I click the Back to Main Page button/ do
  click_link('Back to Main Page')
end

And /I select an option from the drop down/ do

end

When /I visit the all producer tag page/ do
  visit("/producer_tags")
end

When /I visit the all product tag page/ do
  visit("/product_tags")
end


And /Landing already exist/ do
  @landing = Landing.new(allvendorspicture: "https://cdn1-www.dogtime.com/assets/uploads/2011/03/puppy-development.jpg",
                         allvendorsdescription: "Pending",
                         vendorsbycatpicture: "https://cdn1-www.dogtime.com/assets/uploads/2011/03/puppy-development.jpg",
                         vendorsbycatdescription: "Pending",
                         allprodcutspicture: "https://cdn1-www.dogtime.com/assets/uploads/2011/03/puppy-development.jpg",
                         allproductsdescription: "Pending",
                         productsbycatpicture: "https://cdn1-www.dogtime.com/assets/uploads/2011/03/puppy-development.jpg",
                         productsbycatdescription: "Pending",)
end
