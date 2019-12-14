Feature: Edit an existing product in the database

  As a admin
  I want to edit a product in the DB
  So that I can update product information or fix mistakes

  Scenario: Edit product (happy)
    Given I am logged in as an admin
  	Given a vendor already exists
  	Given a product already exists
  	When I visit the product detail page
  	Then I should see an edit button
  	When I go to the edit product page
  	And fill in "Name" with "Product 1"
  	Then I submit the form
  	When I go to the edit product page
  	Then the "Name" field should contain "Product 1"

  Scenario: Try to edit product when not logged in (sad)
    Given I am not logged in
    Given a vendor already exists
    Given a product already exists
    When I go to the edit product page
    Then I go to the customer-facing products index page


