Feature: Add a new vendor to the database

  As a volunteer
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

  Scenario: Successfully add new vendor without tags (happy)
    Given I am on the New Vendor page
    When I fill in the New Vendor form
    And I press "Create Vendor"
    Then the DB should be updated with the new vendor

  Scenario: Successfully add new vendor with tags (happy)
    Given I am on the New Vendor page
    When I fill in the New Vendor form
    And I add a new tag "a"
    And I press "Create Vendor"
    Then the DB should be updated with the new vendor
    And the new vendor should have the tag "a"

#  Scenario: successfully cancel a new vendor action (happy)
#    Given I am on the New Vendor page
#    And I fill in the New Vendor form
#    When I click "cancel_button"
#    Then a confirm popup should appear
#    When I press "cancel_button"
#    Then the DB should not be updated with the new vendor
#
#
#  Scenario: creating new vendor fails (sad)
#
#  Scenario: successfully cancel a cancel action (happy)
#    Given I am on the New Vendor page
#    And I fill in the New Vendor form
#    When I press "cancel_button"
#    Then a confirm popup should appear
#    When I press "cancel_button"
#    Then the DB should not be updated with the new vendor
