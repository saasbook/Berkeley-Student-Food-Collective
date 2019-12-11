When /^there no admin accounts exist$/ do
    Admin.destroy_all
end

Given /^I am not logged in$/ do
    visit path_to("logout")
end


Then /^I remove the first admin$/ do
    accept_alert do
        first(".remove_button").click
    end
end

And /^I confirm the alert box$/ do
    page.driver.browser.switch_to.alert.accept
end