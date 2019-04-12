Feature: Edit an existing vendor in the database

  As a volunteer
  I want to edit a vendor in the DB
  So that I can update vendor information or fix mistakes

  Background:
    Given a vendor with tags already exists
    And I am on the edit vendor page

  Scenario: Edit page should have information pre-filled for vendor (happy)
    Then I should see the vendor attributes filled in
    And the vendor should have a pre-existing tag

  Scenario: Edit vendor attributes (happy)
    When I fill in "Name" with "Vendor 2"
    And I press "Update Vendor"
    Then the vendor should be successfully updated
    Then the "Name" field should contain "Vendor 2"
  
  Scenario: Try editing vendor with no name (sad)
    When I fill in "Name" with ""
    And I press "Create Vendor"
    Then I should be on the edit vendor page
    And I should see an error message
    And I should see the vendor attributes filled in
  
  Scenario: Try editing vendor with duplicate name (sad)
    Given I create a new vendor
    When I fill in the new vendor form
    And I press "Create Vendor"
    Then I should be on the new vendor page
    And I should see an error message
    And I should see the vendor attributes filled in

#  @javascript
#  Scenario: Update vendor by adding tag (happy)
#    When I add a new tag "New Tag"
#    And I press "Update Vendor"
#    Then the vendor should be updated
#    And the vendor should have the tag "New Tag"

#  @javascript
#  Scenario: Update vendor by removing tag (happy)
#    When I check "Remove Tag"
#    And I press "Update Vendor"
#    Then the vendor should be updated
#    And the vendor should have no tags
  
  @javascript
  Scenario: Fill edit vendor form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the vendors page
    And I should not see a success or error message
  
  @javascript
  Scenario: Fill edit vendor form, press cancel, but dismiss (happy)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the edit vendor page
    And I should see the vendor attributes filled in
