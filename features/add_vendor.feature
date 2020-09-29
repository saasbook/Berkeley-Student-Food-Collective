#complete
Feature: Add a new vendor to the database

  As a admin
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

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
    Given a vendor already exists
    And I visit the new vendor form

  Scenario: Add new vendor without tags (happy)
    When I submit the form
    Then I am redirected to the vendor detail page

  Scenario: Try adding vendor with no name (sad)
    When I fill in "Name" with ""
    And I submit the form
    Then I should see an error message


  @javascript
  Scenario: Fill new vendor form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I am redirected to the vendor detail page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new vendor form, press cancel, but dismiss (happy)
    When I press "Cancel"
    And I dismiss the popup
    Then I stay on the new vendor form
    And I should see the new vendors attributes filled in

  Scenario: Try to add vendor when not logged in (sad)
    Given I am not logged in
    When I visit the new vendor form
    Then I go to the customer-facing vendors index page

