Then /I should see no pins on the map/ do
    expect(page).to have_selector('#markers img', count:0)
end