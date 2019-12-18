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


When /^I create first tag category$/ do
    ProductTagCategory.destroy_all
    ProductTagCategory.create(name: "Tag Category", description: "First")
    ProductTagCategory.create(name: "Tag Category2", description: "Second")
end

When /^I create 3 tags with first category$/ do
    ProductTag.create(product_tag_category_id: 1, name: "Tag1")
    ProductTag.create(product_tag_category_id: 1, name: "Tag2")
    ProductTag.create(product_tag_category_id: 1, name: "Tag3")
    ProductTag.create(product_tag_category_id: 2, name: "Tag4")
end
