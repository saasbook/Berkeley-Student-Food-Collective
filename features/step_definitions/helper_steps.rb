When /I submit the form/ do
  page.find('.btn-success').click
end

When /I confirm the popup/ do
  expect{page.driver.browser.switch_to.alert}.not_to raise_error
  page.driver.browser.switch_to.alert.accept
end

When /I dismiss the popup/ do
  expect{page.driver.browser.switch_to.alert}.not_to raise_error
  page.driver.browser.switch_to.alert.dismiss
end

Then /I should see a success message/ do
  expect(page).to have_css('#notice.alert-success')
end

Then /I should see an error message on (.*)/ do |page_name|
  step %{I should be on #{page_name}}
  expect(page).to have_css('#notice.alert-danger')
end

Then /I should see an error message/ do
  expect(page).to have_css('#notice.alert-danger')
end

Then /I should not see a success or error message/ do
  expect(page).not_to have_css('#notice.alert-success')
  expect(page).not_to have_css('#notice.alert-danger')
end

Then /I should see a letter navbar/ do
  expect(page).to have_selector("#letter-nav")
end

Then /I should not see a letter navbar/ do
  expect(page).not_to have_selector("#letter-nav")
end