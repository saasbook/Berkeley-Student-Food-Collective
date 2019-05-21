Feature: Add a new product to the database

  As a volunteer
  I want to add a product to the DB
  So that customers can learn more about the product

  Background:
    Given a vendor already exists
    And product tags already exist
    And I fill in the new product form
  
  Scenario: Add new product without tags (happy)
    When I submit the form
    Then the product should be successfully added
    And I should see the product attributes filled in

  Scenario: Try adding product with no name (sad)
    When I fill in "Name" with ""
    And I submit the form
    Then I should see an error message on the new product page
    And I should see the product attributes, except "name", filled in

  Scenario: Try adding product with no vendor (sad)
    When I fill in the new product form except the vendor field
    And I submit the form
    Then I should see an error message on the new product page
    And I should see the product attributes, except "vendor", filled in

  @javascript
  Scenario: Add new product with only existing tags (happy)
    When I add pre-existing product tags
    And I submit the form
    Then the product should be successfully added
    And the product should have pre-existing tags

  @javascript
  Scenario: Add new product with only new tags (happy)
    When I add new product tags
    And I submit the form
    Then the product should be successfully added
    And the product should have new tags

  @javascript
  Scenario: Add new product with blank tag names (sad)
    When I add new blank product tags
    And I submit the form
    Then I should see an error message on the new product page
    And I should see the product attributes filled in

  @javascript
  Scenario: Add new product with existing tags and new tags (happy)
    When I add pre-existing product tags
    And I add new product tags
    And I submit the form
    Then the product should be successfully added
    And the product should have pre-existing tags
    And the product should have new tags

  @javascript
  Scenario: Add new product while adding and removing existing tags (happy)
    When I add pre-existing product tags
    And I remove the pre-existing product tags
    And I submit the form
    Then the product should be successfully added
    And the product should have no tags

  @javascript
  Scenario: Add new product while adding and removing new tags (happy)
    When I add new product tags
    And I remove the new product tags
    And I submit the form
    Then the product should be successfully added
    And the product should have no tags

  @javascript
  Scenario: Fill new product form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the volunteer-facing products index page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new product form, press cancel, but dismiss (happy)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the new product page
    And I should see the product attributes filled in
  
  @javascript
  Scenario: Add new product with a bad picture (sad)
    When I include a bad picture
    And I submit the form
    Then I should see an error message on the new product page
    And I should see the product attributes, except "picture", filled in
    And no products should exist
