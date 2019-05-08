Feature: View and Interact with a Carousel of Products and Vendors

  As a customer
  In order to discover new products in a category
  I want to see a carousel of vendors or products with the same tag on the discovery page

  @javascript
  Scenario: Hover Slide Interaction with Carousel (happy)
    Given I create three new vendors
    And I am on the Discovery page
    When I hover over the second carousel element
    Then the left elements should shift to the left
    And the right elements should shift to the right

  @javascript
  Scenario: Carousels for products should show up correctly (happy)
    Given I create three new products
    And I am on the Discovery page
    Then I should see a carousel for the product tag type "Original Packaging Name"
    And I should see all products with the tag "Original Packaging Name"
    And I should see a carousel for the product tag type "Original Nutrition Name"
    And I should see all products with the tag "Original Nutrition Name"
    And I should see a carousel for the product tag type "Original Certification Name"
    And I should see all products with the tag "Original Certification Name"

  @javascript
  Scenario: Carousels for vendors should show up correctly (happy)
    Given I create three new vendors
    And I am on the Discovery page
    And I should see a carousel for the ownership type "Original Ownership Name"
    Then I should see all vendors with owned by "Original Ownership Name"

  Scenario: Carousel for products with nutrition tags
    Given I create four new products
    And I am on the Discovery page
    And I should see a carousel for the type "Vegan"
    Then I should see all the "Vegan" products

  Scenario: Carousel for product with Real Food Challenge tags
    Given I create four new products
    And I am on the Discovery page
    And I should see a carousel for the type "Humane"
    Then I should see all the "Humane" products