Feature: Edit an existing vendor in the database

  As a volunteer
  I want to edit a vendor in the DB
  So that I can update vendor information or fix mistakes

  Background:
    Given I create a new vendor with tags
    And I am on the Edit Vendor page

  Scenario: Edit page should have information pre-filled for vendor (happy)
    Then I should see the attributes filled in
    And I should see the tags filled in

  Scenario: Edit vendor attributes (happy)
    When I fill in "Name" with "Vendor 2"
    And I press "Update Vendor"
    Then the vendor should be updated
    And I go to the Edit Vendor page
    Then the "Name" field should contain "Vendor 2"

  @javascript
  Scenario: Update vendor by adding tag (happy)
    When I add a new tag "New Tag"
    And I press "Update Vendor"
    Then the vendor should be updated
    And the vendor should have the tag "New Tag"

  @javascript
  Scenario: Update vendor by removing tag (happy)
    When I check "Remove Tag"
    And I press "Update Vendor"
    Then the vendor should be updated
    And the vendor should have no tags

  Scenario: Try updating vendor with no name (sad)
    When I fill in "Name" with ""
    And I press "Update Vendor"
    Then I should be on the Edit Vendor page
    And I should see "Vendor needs a name"
    And I should see the attributes, except "Name", filled in

  @javascript
  Scenario: Fill new vendor form, press cancel, and confirm (sad)
    When I press "Cancel"
    And I confirm the popup
    Then the vendor should not be updated

  @javascript
  Scenario: Fill new vendor form, press cancel, but dismiss (sad)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the Edit Vendor page
    And I should see the attributes filled in
