Feature: Delete a product

  As a admin
  I want to be able to delete a product
  So I can remove outdated or incorrect products

  Background:
    Given I am logged in as an admin
    And a vendor already exists

  @javascript
  Scenario: Delete a product without tags
  	Given a product already exists
  	When I visit the product detail page
  	Then I should see an edit button
  	When I go to the edit product page
  	And I click on delete
    And I confirm the popup
    Then I go to the customer-facing products index page