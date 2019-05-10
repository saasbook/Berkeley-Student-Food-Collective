Given /I am using a mobile device/ do
  Capybara.page.driver.header('user-agent', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1')
end

When /I submit the form/ do
  page.find('input[type="submit"]').click
end

When /I include a bad picture/ do
  fill_in :Picture, with: 'www.google.com'
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