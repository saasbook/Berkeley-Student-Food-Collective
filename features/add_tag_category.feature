#complete
Feature: Add a new tag category to the database

  As an admin
  I want to add a tag category to the DB
  So that customers can learn more about the products

  Background:
    Given I am not logged in

  Scenario: Add new tag category without being logged in (happy)
    Given I visit the new tag category form
    Then I should be on the discovery page

  Scenario: Add new tag category (happy)
    Given I am logged in as an admin
    Given I visit the new tag category form
    And I fill in "Name" with "Tag"
    And I fill in "Description" with "Hello"
    When I submit the form
    Then I should be on the Product Tag Categories page


  @javascript
  Scenario: Fill new tag category form, press cancel, and confirm (happy)
    Given I am logged in as an admin
    Given I visit the new tag category form
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the discovery page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new tag category, press cancel, but dismiss (happy)
    Given I am logged in as an admin
    Given I visit the new tag category form
    And I fill in "Name" with "Tag"
    When I press "Cancel"
    But I dismiss the popup
    Then I should see the new tag category page
    And I should see the tag category attributes filled in