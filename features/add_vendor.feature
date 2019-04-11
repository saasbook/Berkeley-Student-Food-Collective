Feature: Add a new vendor to the database

  As a volunteer
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

  Scenario: Add new vendor without tags (happy)
    When I fill in the New Vendor form
    And I press "Create Vendor"
    Then I should be on the All Vendors page
    And I should see a success message

  Scenario: Try adding vendor with no name (sad)
    When I fill in the New Vendor form
    And I fill in "Name" with ""
    And I press "Create Vendor"
    Then I should be on the New Vendor page
    And I should see an error message
    And I should see the vendor attributes, except "Name", filled in

  Scenario: Try adding vendor with duplicate name (sad)
    Given I create a new vendor
    When I fill in the New Vendor form
    And I press "Create Vendor"
    Then I should be on the New Vendor page
    And I should see an error message
    And I should see the vendor attributes filled in

  @javascript
  Scenario: Add new vendor with only existing tags (happy)
    Given I
    When I fill in the New Vendor form
    And I add a new tag "Some Tag"
    And I press "Create Vendor"
    Then the vendor should be added
    And the vendor should have the tag "Some Tag"

#  @javascript
#  Scenario: Fill new vendor form, press cancel, and confirm (sad)
#    When I fill in the New Vendor form
#    And I press "Cancel"
#    And I confirm the popup
#    Then the vendor should not be added
#
#  @javascript
#  Scenario: Fill new vendor form, press cancel, but dismiss (sad)
#    When I fill in the New Vendor form
#    And I press "Cancel"
#    But I dismiss the popup
#    Then I should be on the New Vendor page
#    And I should see the vendor attributes filled in
