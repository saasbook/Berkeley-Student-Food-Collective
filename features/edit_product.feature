Feature: Edit an existing product in the database

  As a volunteer
  I want to edit a product in the DB
  So that I can update product information or fix mistakes

  Background:
    Given a vendor already exists
    And a product with tags already exists
    And other product tags already exist
    And I am on the edit product page

  Scenario: Edit page should have information pre-filled for product (happy)
    Then I should see the product attributes filled in
    And the product should have its original tags

  Scenario: Edit product attributes (happy)
    When I fill in "Name" with "Updated Product"
    And I submit the form
    Then the product should be successfully updated
    And the "Name" field should contain "Updated Product"
    And the product should have its original tags

  Scenario: Edit product's vendor (happy)
    Given another vendor already exists
    When I go to the edit product page
    And I select the product's vendor as the other vendor
    And I submit the form
    Then the product should be successfully updated
    And the product's vendor should be the other vendor
    And the product should have its original tags

  Scenario: Try updating product with no name (sad)
    When I fill in "Name" with ""
    And I submit the form
    Then I should see an error message on the edit product page
    And I should see the product attributes, except "Name", filled in
    And the product should have its original tags

  @javascript
  Scenario: Edit product by adding pre-existing tag (happy)
    When I add pre-existing product tags
    And I submit the form
    Then the product should be successfully updated
    And the product should have its original tags
    And the product should have pre-existing tags

  @javascript
  Scenario: Edit product by adding new tags (happy)
    When I add new product tags
    And I submit the form
    Then the product should be successfully updated
    And the product should have its original tags
    And the product should have new tags

  @javascript
  Scenario: Edit new product with blank tag names (sad)
    When I add new blank product tags
    And I submit the form
    Then I should see an error message on the edit product page
    And I should see the product attributes filled in

  @javascript
  Scenario: Edit product by adding pre-existing and new tag (happy)
    When I add pre-existing product tags
    And I add new product tags
    And I submit the form
    Then the product should be successfully updated
    And the product should have its original tags
    And the product should have pre-existing tags
    And the product should have new tags

  @javascript
  Scenario: Edit product by removing its original tags (happy)
    When I remove the original product tags
    And I submit the form
    Then the product should be successfully updated
    And the product should have no tags

  @javascript
  Scenario: Edit product by adding and removing existing tags (happy)
    When I add pre-existing product tags
    And I remove the pre-existing product tags
    And I submit the form
    Then the product should be successfully updated
    And the product should have its original tags

  @javascript
  Scenario: Edit product by adding and removing existing tags (happy)
    When I add new product tags
    And I remove the new product tags
    And I submit the form
    Then the product should be successfully updated
    And the product should have its original tags

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
    Then I should be on the edit product page
    And I should see the product attributes filled in
    And the product should have its original tags
  
  @javascript
  Scenario: Edit product with a bad picture (sad)
    When I include a bad picture
    And I submit the form
    Then I should see an error message on the edit product page
    And I should see the product attributes, except "picture", filled in
