Feature: Delete a vendor

  As a admin,
  I want to be able to delete a vendor
  So I can remove outdated or incorrect vendor

  @javascript
  Scenario: Delete a vendor without tags
    Given I am logged in as an admin
    Given I visit the new vendor form
    And I fill in "Name" with "V1"
    And I fill in "Story" with "Hello"
    And I submit the form
    Then I am redirected to the vendor detail page
    When I go to the vendor page
    Then I should see an edit button
    When I go to the edit vendor page
    And I click on delete
    And I confirm the popup
    Then I go to the customer-facing vendors index page