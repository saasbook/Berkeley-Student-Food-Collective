Feature: Add a new vendor to the database

  As a volunteer
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

  Scenario: Add new vendor without tags (happy)
    When I fill in the new vendor form
    And I press "Create Vendor"
    Then the vendor should be successfully added
    And I should see the vendor attributes filled in

  Scenario: Try adding vendor with no name (sad)
    When I fill in the new vendor form
    And I fill in "Name" with ""
    And I press "Create Vendor"
    Then I should be on the new vendor page
    And I should see an error message
    And I should see the vendor attributes, except "Name", filled in

  Scenario: Try adding vendor with duplicate name (sad)
    Given I create a new vendor
    When I fill in the new vendor form
    And I press "Create Vendor"
    Then I should be on the new vendor page
    And I should see an error message
    And I should see the vendor attributes filled in

  @javascript
  Scenario: Add new vendor with only existing tags (happy)
    Given a vendor tag already exists
    When I fill in the New Vendor form
    And I add a pre-existing vendor tag
    And I press "Create Vendor"
    Then the vendor should be successfully added
    And I should see the vendor attributes filled in
    And the vendor should have the tags: "Some Tag"

  # TODO: Add tests for new tags, existing + new tags, adding existing + delete, and adding new + delete

  @javascript
  Scenario: Fill new vendor form, press cancel, and confirm (sad)
    When I fill in the new vendor form
    And I press "Cancel"
    And I confirm the popup
    Then I should be on the vendors page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new vendor form, press cancel, but dismiss (sad)
    When I fill in the new vendor form
    And I press "Cancel"
    But I dismiss the popup
    Then I should be on the new vendor page
    And I should see the vendor attributes filled in
