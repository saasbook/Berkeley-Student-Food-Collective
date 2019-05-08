Feature: Delete a vendor
  
  As a volunteer,
  I want to be able to delete a vendor
  So I can remove outdated or incorrect vendor
  
  Scenario: Delete a vendor without tags
    Given a vendor already exists
    And I am on the edit vendor page
    When I follow "Delete"
    Then I should be on the volunteer-facing vendors index page
    And I should see a success message
    And no vendors should exist
  
  Scenario: Delete a vendor with tags
    Given a vendor with a tag already exists
    And I am on the edit vendor page
    When I follow "Delete"
    Then I should be on the volunteer-facing vendors index page
    And I should see a success message
    And no vendors should exist
    And no vendor tags should be deleted
  
  Scenario: Delete a vendor with products
    Given a vendor with a tag already exists
    And a product with tags already exists
    And I am on the edit vendor page
    When I follow "Delete"
    Then I should be on the volunteer-facing vendors index page
    And I should see a success message
    And no vendors should exist
    And no products should exist
    And no vendor tags should be deleted
    And no product tags should be deleted