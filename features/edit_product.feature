Feature: Edit an existing product in the database

  As a volunteer
  I want to edit a product in the DB
  So that I can update product information or fix mistakes

  Background:
    Given I create a new vendor with tags
    And I create a new product
    And I am on the Edit Product page

  Scenario: Edit page should have information pre-filled for product (happy)
    Then I should see the product attributes filled in

  Scenario: Edit product attributes (happy)
    When I fill in "Name" with "Updated Product"
    And I press "Update Product"
    Then the product should be updated
    When I go to the Edit Product page
    Then the "Name" field should contain "Updated Product"

  Scenario: Edit product's vendor (happy)
    Given I create a new vendor with name of "Vendor 2"
    When I go to the Edit Product page
    And I select "Vendor 2" from "product_vendor_id"
    And I press "Update Product"
    Then the product should be updated
    # TODO: check if vendor is updated in edit product page

  Scenario: Try updating product with no name (sad)
    When I fill in "Name" with ""
    And I press "Update Product"
    Then I should be on the Edit Product page
    And I should see "Product needs a name and a vendor"
    # TODO: check if form attributes are still there

  @javascript
  Scenario: Fill edit product form, press cancel, and confirm (sad)
    When I press "Cancel"
    And I confirm the popup
    Then the product should not be updated

  @javascript
  Scenario: Fill edit product form, press cancel, but dismiss (sad)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the Edit Product page
    And I should see the product attributes filled in
