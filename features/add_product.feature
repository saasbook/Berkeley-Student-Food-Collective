Feature: Add a new product to the database

  As a volunteer
  I want to add a product to the DB
  So that customers can learn more about the product

  Background:
    Given I create a new vendor with tags

  Scenario: Add new product (happy)
    When I fill in the New Product form
    And I press "Create Product"
    Then the product should be added

  Scenario: Try adding product with no name (sad)
    When I fill in the New Product form
    And I fill in "Name" with ""
    And I press "Create Product"
    Then I should be on the New Product page
    And I should see "Product needs a name and a vendor"
    And I should see the product attributes, except "Name", filled in

  Scenario: Try adding product with no vendor (sad)
    When I fill in the New Product form except Vendor
    And I press "Create Product"
    Then I should be on the New Product page
    And I should see "Product needs a name and a vendor"
    # TODO: Technically doesn't check this
    And I should see the product attributes, except "Vendor", filled in

  @javascript
  Scenario: Fill new product form, press cancel, and confirm (sad)
    When I fill in the New Product form
    And I press "Cancel"
    And I confirm the popup
    Then the product should not be added

  @javascript
  Scenario: Fill new product form, press cancel, but dismiss (sad)
    When I fill in the New Product form
    And I press "Cancel"
    But I dismiss the popup
    Then I should be on the New Product page
    And I should see the product attributes filled in
