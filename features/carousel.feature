Feature: View and Interact with a Carousel of Products and Vendors

  As a customer
  In order to discover new products in a category
  I want to see a carousel of vendors or products with the same tag on the discovery page

  @javascript
  Scenario: Carousels for products should show up correctly (happy)
    Given I create 5 new products
    And I am on the Discovery page
    Then I should see a carousel for the product tag type "Original Packaging Name"
    And I should see 5 products with the tag "Original Packaging Name"
    And I should see a carousel for the product tag type "Original Nutrition Name"
    And I should see 5 products with the tag "Original Nutrition Name"
    And I should see a carousel for the product tag type "Original Certification Name"
    And I should see 5 products with the tag "Original Certification Name"
    And I should see a carousel for the product tag type "Vegan"
    And I should see 5 products with the tag "Vegan"
    And I should see a carousel for the product tag type "Humane"
    And I should see 5 products with the tag "Humane"

  @javascript
  Scenario: Carousels for vendors should show up correctly (happy)
    Given I create 5 new vendors
    And I am on the Discovery page
    And I should see a carousel for the ownership type "Original Ownership Name"
    Then I should see 5 vendors with owned by "Original Ownership Name"

  Scenario: Don't see carousel for tag with 3 vendors
    Given I create 3 new vendors
    And I am on the Discovery page
    Then I should not see a carousel for the ownership type "Original Ownership Name"

  Scenario: Don't see carousel for tag with photo-less vendors
    Given I create 5 new photo-less vendors
    And I am on the Discovery page
    Then I should not see a carousel for the ownership type "Original Ownership Name"

  Scenario: Don't see carousel for tag with 3 products
    Given I create 3 new products
    And I am on the Discovery page
    Then I should not see a carousel for the type "Original Packaging Name"
    Then I should not see a carousel for the type "Original Nutrition Name"
    Then I should not see a carousel for the type "Original Certification Name"
    Then I should not see a carousel for the type "Vegan"
    Then I should not see a carousel for the type "Humane"

  Scenario: Only see up to fourteen products
    Given I create 16 new products
    And I am on the Discovery page
    Then I should see a carousel for the product tag type "Original Packaging Name"
    And I should see 15 products with the tag "Original Packaging Name"

  Scenario: Only see up to fourteen vendors
    Given I create 16 new vendors
    And I am on the Discovery page
    Then I should see a carousel for the ownership type "Original Ownership Name"
    Then I should see 15 vendors with owned by "Original Ownership Name"


  Scenario: Don't see carousel for tag with photo-less products
    Given I create 5 new photo-less products
    And I am on the Discovery page
    Then I should not see a carousel for the type "Original Packaging Name"
    Then I should not see a carousel for the type "Original Nutrition Name"
    Then I should not see a carousel for the type "Original Certification Name"
    Then I should not see a carousel for the type "Vegan"
    Then I should not see a carousel for the type "Humane"

  Scenario: Don't see carousel for unused nutrition tag
    Given I create 5 new products
    And I am on the Discovery page
    Then I should not see a carousel for the type "Gluten Free"
