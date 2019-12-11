When /^there no admin accounts exist$/ do
    Admin.destroy_all
end

Given /^I am not logged in$/ do
    visit path_to("logout")
end