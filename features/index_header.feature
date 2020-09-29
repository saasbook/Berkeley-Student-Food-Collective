Feature: Navigate customer-facing index page with navbar
  
  Background:
    Given I am on the discovery page
    
#  Scenario: Click on home link in navbar
#    When I follow "Discovery"
#    Then I should be on the discovery page

#  Scenario: Click on vendors in navbar
#    When I click on "Vendors"
#    Then I should see a drop down menu
#    When I click on "All Vendors"
#    Then I should be on the customer-facing my_vendors index page
#
#  Scenario: Click on vendors link in navbar
#    When I click on "Vendors"
#    Then I should see a drop down menu
#    When I click on "By Category"
#    Then I should be on the customer-facing producer_tags index page
#
#
#  Scenario: Click on products in navbar
#    When I click on "Products"
#    Then I should see a drop down menu
#    When I click on "All Products"
#    Then I should be on the customer-facing my_products index page
#
#  Scenario: Click on products in navbar
#    When I click on "Products"
#    Then I should see a drop down menu
#    When I click on "By Category"
#    Then I should be on the customer-facing product_tags index page

#  Scenario: Click on products link in navbar
#    When I follow "Products"
#    Then I should be on the customer-facing products index page


#  Scenario: Click on vendors link in navbar
#    When I follow "Vendors"
#    Then I should be on the customer-facing vendors index page
#
#  Scenario: Click on products link in navbar
#    When I follow "Products"
#    Then I should be on the customer-facing products index page
  
  Scenario: Click on picture in navbar
    When I follow "logo"
    Then I should be on the discovery page