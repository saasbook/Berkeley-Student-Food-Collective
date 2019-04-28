Feature: Add a new vendor to the database

  As a volunteer
  I want to add a vendor to the DB
  So that customers can learn more about the vendor

  Background:
    Given a vendor tag already exists
    And I fill in the new vendor form

  Scenario: Add new vendor without tags (happy)
    When I submit the form
    Then the vendor should be successfully added
    And I should see the vendor attributes filled in

  Scenario: Try adding vendor with no name (sad)
    When I fill in "Name" with ""
    And I submit the form
    Then I should see an error message on the new vendor page
    And I should see the vendor attributes, except "Name", filled in

  Scenario: Try adding vendor with duplicate name (sad)
    Given a vendor already exists
    When I fill in the new vendor form
    And I submit the form
    Then I should see an error message on the new vendor page
    And I should see the vendor attributes filled in

  @javascript
  Scenario: Add new vendor with only existing tag (happy)
    When I add a pre-existing vendor tag
    And I submit the form
    Then the vendor should be successfully added
    And the vendor should have a pre-existing tag

  @javascript
  Scenario: Add new vendor with only new tag (happy)
    When I add a new vendor tag
    And I submit the form
    Then the vendor should be successfully added
    And the vendor should have a new tag

  @javascript
  Scenario: Add new vendor with blank tag name (sad)
    When I add a new blank vendor tag
    And I submit the form
    Then I should see an error message on the new vendor page
    And I should see the vendor attributes filled in

  @javascript
  Scenario: Add new vendor with existing tag and new tag (happy)
    When I add a pre-existing vendor tag
    And I add a new vendor tag
    And I submit the form
    Then the vendor should be successfully added
    And the vendor should have a pre-existing tag
    And the vendor should have a new tag

  @javascript
  Scenario: Add new vendor while adding and removing existing tag (happy)
    When I add a pre-existing vendor tag
    And I check "Remove Ownership Type"
    And I submit the form
    Then the vendor should be successfully added
    And the vendor should have no tags

  @javascript
  Scenario: Add new vendor while adding and removing new tag (happy)
    When I add a new vendor tag
    And I check "Remove Ownership Type"
    And I submit the form
    Then the vendor should be successfully added
    And the vendor should have no tags

  @javascript
  Scenario: Fill new vendor form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the volunteer-facing vendors index page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new vendor form, press cancel, but dismiss (happy)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the new vendor page
    And I should see the vendor attributes filled in

  @javascript
  Scenario: Add new vendor with a bad picture (sad)
    When I include a bad picture
    And I submit the form
    Then I should see an error message on the new vendor page
    And I should see the vendor attributes, except "picture", filled in
    And no vendors should exist
