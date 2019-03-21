Feature: add a new vendor to the database

  As a volunteer
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

  Scenario: successfully add new vendor (happy)
    Given I am on the New Vendor page
    And I fill in the New Vendor form
    When I press "submit_button"
    Then the DB should be updated with the new vendor


  Scenario: successfully cancel a new vendor action (happy)
    Given I am on the New Vendor page
    And I fill in the New Vendor form
    When I click "cancel_button"
    Then a confirm popup should appear
    When I press "cancel_button"
    Then the DB should not be updated with the new vendor


  Scenario: creating new vendor fails (sad)

  Scenario: successfully cancel a cancel action
    Given I am on the New Vendor page
    And I fill in the New Vendor form
    When I press "cancel_button"
    Then a confirm popup should appear
    When I press "cancel_button"
    Then the DB should not be updated with the new vendor
