Feature: Edit an existing product in the database

  As a admin
  I want to edit a product in the DB
  So that I can update product information or fix mistakes

  Background:
  	Given I am logged in as an admin

  Scenario: Edit product (happy)
  	Given a vendor already exists
  	Given a product already exists
  	When I visit the product detail page
  	Then I should see an edit button
  	When I go to the edit product page
  	And fill in "Name" with "Product 1"
  	Then I submit the form
  	When I go to the edit product page
  	Then the "Name" field should contain "Product 1"





#    Given a vendor already exists
#    And a product already exists
#    And other product tags already exist
#    And I am on the edit product page
#
#  Scenario: Edit page should have information pre-filled for product (happy)
#    Then I should see the product attributes filled in
#    And the product should have its original tags



