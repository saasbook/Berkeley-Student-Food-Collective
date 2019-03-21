Feature: add a new vendor to the database

  As a volunteer
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

  Scenario: successfully add new vendor (happy)
    Given I am on the New Vendor page
    And I fill in the New Vendor form
    When I press "submit_button"
    Then the DB should be updated with the new vendor

