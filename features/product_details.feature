Feature: View the Details Page of a Product

  As a customer
  I want to view the details of a product
  So that I can see all of the information about a product

  Scenario: See the product details page (happy)
    Given a vendor already exists
    Given a product already exists
    When I visit the product detail page
    Then I should see the photo and description

