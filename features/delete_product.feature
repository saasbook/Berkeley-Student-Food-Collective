Feature: Delete a product
  
  As a volunteer,
  I want to be able to delete a product
  So I can remove outdated or incorrect products
  
  Background:
    Given a vendor already exists
  
  Scenario: Delete a product without tags
    Given a product already exists
    And I am on the edit product page
    When I follow "Delete"
    Then I should be on the volunteer-facing products index page
    And I should see a success message
    And no products should exist
    
  Scenario: Delete a product with tags
    Given a product with tags already exists
    And I am on the edit product page
    When I follow "Delete"
    Then I should be on the volunteer-facing products index page
    And I should see a success message
    And no products should exist
    And no product tags should be deleted