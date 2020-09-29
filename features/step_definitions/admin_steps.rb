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


When /^I create 5 products$/ do
    ProductTagCategory.destroy_all
    ProductTagCategory.create(name: "Tag Category", description: "First")
    ProductTag.create(product_tag_category_id: 1, name: "Tag1")
    MyVendor.destroy_all
    MyVendor.create(name: 'Vendor1',
                         picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528',
                         story: 'These are apples',
                         facebook: 'https://www.facebook.com/',
                         twitter: 'https://www.facebook.com/',
                         instagram: 'https://www.facebook.com/')
    p1 = MyProduct.create(my_vendor_id: 1, name: "P1", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", description: "These are apples")
    p2 = MyProduct.create(my_vendor_id: 1, name: "P2", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", description: "These are apples")
    p3 = MyProduct.create(my_vendor_id: 1, name: "P3", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", description: "These are apples")
    p4 = MyProduct.create(my_vendor_id: 1, name: "P4", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", description: "These are apples")
    p5 = MyProduct.create(my_vendor_id: 1, name: "P5", picture: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528", description: "These are apples")
    p1.update_attributes(:tagslist => "Tag1")
    p2.update_attributes(:tagslist => "Tag1")
    p3.update_attributes(:tagslist => "Tag1")
    p4.update_attributes(:tagslist => "Tag1")
    p5.update_attributes(:tagslist => "Tag1")
end

When /^I create 5 vendors$/ do
    ProducerTag.create(name: "Producer Tag1")
    MyVendor.destroy_all
    v1 = MyVendor.create(name: 'V1',
                         picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528',
                         story: 'These are apples')
    v2 = MyVendor.create(name: 'V2',picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528', story: 'These are apples')
    v3 = MyVendor.create(name: 'V3',picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528', story: 'These are apples')
    v4 = MyVendor.create(name: 'V4',picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528', story: 'These are apples')
    v5 = MyVendor.create(name: 'V5',picture: 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg?w=1155&h=1528', story: 'These are apples')
    v1.update_attributes(:tagslist => "Producer Tag1")
    v2.update_attributes(:tagslist => "Producer Tag1")
    v3.update_attributes(:tagslist => "Producer Tag1")
    v4.update_attributes(:tagslist => "Producer Tag1")
    v5.update_attributes(:tagslist => "Producer Tag1")
end