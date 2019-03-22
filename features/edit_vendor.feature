Feature: Edit an existing vendor in the database

  As a volunteer
  I want to edit a vendor in the DB
  So that I can update vendor information or fix mistakes

  Background:
    Given I create a new vendor

  Scenario: Edit page should have information pre-filled for vendor (happy)
    Given I am on the Edit Vendor page
    Then I should see the attributes, except tags, filled in
    And I should see the tags filled in

#  Scenario: creating new vendor fails (sad)
#
#  Scenario: successfully cancel a cancel action (happy)
#    Given I am on the New Vendor page
#    And I fill in the New Vendor form
#    When I press "cancel_button"
#    Then a confirm popup should appear
#    When I press "cancel_button"
#    Then the DB should not be updated with the new vendor
