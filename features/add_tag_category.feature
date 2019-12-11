Feature: Add a new tag category to the database

  As an admin
  I want to add a tag category to the DB
  So that customers can learn more about the products

  Background:
    Given I fill the new tag category form

  Scenario: Add new tag category (happy)
    When I submit the form
    Then the tag category should be successfully added
    And I should be on the discovery page


  @javascript
  Scenario: Fill new tag category form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the discovery page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new tag category, press cancel, but dismiss (happy)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the new tag category page
    And I should see the tag category attributes filled in