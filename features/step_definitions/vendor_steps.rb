Given /I create a new vendor/ do
  FactoryBot.create(:vendor)
end

Given /a vendor tag already exists/ do
  FactoryBot.create(:ownership)
  FactoryBot.create(:ownership, {name: 'Ownership 2'})
end

When /I fill in the new vendor form/ do
  step %{I am on the new vendor page}
  FactoryBot.attributes_for(:vendor).each do |key, value|
    step %{I fill in "vendor_#{key}" with "#{value}"}
  end
end

When /I add a pre-existing vendor tag/ do
  select FactoryBot.attributes_for(:ownership)[:name], from: :existing_ownerships
end

When /I add a new tag "(.*)"/ do |tag|
  steps %Q{
  	When I fill in "new_tag_field" with "#{tag}"
		And I press "Add new tag"
	}
end

Then /the vendor should be successfully added/ do
  steps %Q{
    Then I should be on the vendors page
    And I should see a success message
    And I go to the edit vendor page
  }
end

Then /I should see the vendor attributes(, except "(.*)",)? filled in/ do |exclude|
  FactoryBot.attributes_for(:vendor).each do |key, value|
    if exclude.nil? or key.downcase.to_s != exclude.downcase
      step %{the "vendor[#{key}]" field should contain "#{value}"}
    end
  end
end

Then /the vendor should have the tags: "(.*)"/ do |tag|
  step %{I am on the Edit Vendor page}
  within('div#tags') do
    expect(page).to have_selector("input[value='#{tag}']")
  end
end

Then /the vendor should have no tags/ do
  step %{I am on the Edit Vendor page}
  expect(page.all('.tag').length).to eq(0)
end

Then /I should see the tags filled in/ do
	expected_tags = Vendor.find(1).tags.pluck(:name)
  actual_tags = page.all('.tag')
  expect(expected_tags.length == actual_tags.length)
  actual_tags.each do |actual_tag|
    within(actual_tag) do
      expect(expected_tags).to include(page.find('input[type="text"]').value)
    end
  end
end
