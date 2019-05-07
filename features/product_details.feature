Feature: View the Details Page of a Product

  As a customer
  I want to view the details of a product
  So that I can see all of the information about a product

Scenario: See the customer-facing product details page (happy)
    Given a vendor already exists
    And a product already exists
    When I go to the customer-facing product detail page
    Then I should see the vendor, photo, origin, cultural history and tags of the product

Scenario: Click the vendor name on the customer-facing product details page (happy)
    Given a vendor already exists
    And a product already exists
    When I go to the customer-facing product detail page
    And I click on the vendor name
    Then I should be on the customer-facing vendor detail page