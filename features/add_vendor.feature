Feature: add a new vendor to the database

  As a volunteer
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

  Scenario: successfully add new vendor (happy)
    Given I am on "New Vendor Page"
    And I fill in the "New Vendor Form"
    When I press "save_button"
    Then the DB should be updated with the new vendor.

  Scenario: successfully cancel a new vendor action (happy)
    Given I am on "New Vendor Page"
    And I fill in the "New Vendor Form"
    When I press "cancel_add_vendor"
    Then a confirm popup should appear
    When I press "Cancel"
    Then the DB should not be updated with the new vendor.


  Scenario: creating new vendor fails (sad)

  Scenario: clicking cancel creates a confirm popup
