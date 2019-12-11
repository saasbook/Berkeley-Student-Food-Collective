#complete
Feature: Add a new tag category to the database

  As an admin
  I want to add a tag category to the DB
  So that customers can learn more about the products

  Background:
    Given I am not logged in
    Given there are no admin accounts exists
    Then I go to The Admins Control page
    When I press "Add New Admin"
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I fill in "Password confirmation" with "123"
    When I press "Create Admin"
    Then I go to the Discovery page
    When I press "Login"
    Then I am on the Admin Welcome page
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I should be on the Discovery page
    And I should see "ADMIN"
    Given I visit the new tag category form

  Scenario: Add new tag category (happy)
    And I fill in "Name" with "Tag"
    And I fill in "Description" with "Hello"
    When I submit the form
    Then I should be on the discovery page


  @javascript
  Scenario: Fill new tag category form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the discovery page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new tag category, press cancel, but dismiss (happy)
    And I fill in "Name" with "Tag"
    When I press "Cancel"
    But I dismiss the popup
    Then I should see the new tag category page
    And I should see the tag category attributes filled in