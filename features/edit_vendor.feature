Feature: Edit an existing vendor in the database

  As a volunteer
  I want to edit a vendor in the DB
  So that I can update vendor information or fix mistakes

  Background:
    Given a vendor with a tag already exists
    And another vendor tag already exists
    And I am on the edit vendor page

  Scenario: Edit page should have information pre-filled for vendor (happy)
    Then I should see the vendor attributes filled in
    And the vendor should have its original tag

  Scenario: Edit vendor attributes (happy)
    When I fill in "Name" with "Vendor 2"
    And I submit the form
    Then the vendor should be successfully updated
    And the "Name" field should contain "Vendor 2"
    And the vendor should have its original tag

  Scenario: Try editing vendor with no name (sad)
    When I fill in "Name" with ""
    And I submit the form
    Then I should see an error message on the edit vendor page
    And I should see the vendor attributes, except "Name", filled in
    And the vendor should have its original tag

  Scenario: Try editing vendor with duplicate name (sad)
    Given another vendor already exists
    And I am on the edit vendor page
    When I fill in "Name" with the other vendor's name
    And I submit the form
    Then I should see an error message on the edit vendor page
    And I should see the vendor attributes, except "Name", filled in
    And the vendor should have the other vendor's name
    And the vendor should have its original tag

  @javascript
  Scenario: Edit vendor by adding pre-existing tag (happy)
    When I add a pre-existing vendor tag
    And I submit the form
    Then the vendor should be successfully updated
    And the vendor should have its original tag
    And the vendor should have a pre-existing tag

  @javascript
  Scenario: Edit vendor by adding new tag (happy)
    When I add a new vendor tag
    And I submit the form
    Then the vendor should be successfully updated
    And the vendor should have its original tag
    And the vendor should have a new tag

  @javascript
  Scenario: Edit new vendor with blank tag name (sad)
    When I add a new blank vendor tag
    And I submit the form
    Then I should see an error message on the edit vendor page
    And I should see the vendor attributes filled in

  @javascript
  Scenario: Edit vendor by adding pre-existing and new tag (happy)
    When I add a pre-existing vendor tag
    And I add a new vendor tag
    And I submit the form
    Then the vendor should be successfully updated
    And the vendor should have its original tag
    And the vendor should have a pre-existing tag
    And the vendor should have a new tag

  @javascript
  Scenario: Edit vendor by removing its original tag (happy)
    When I check "Remove Ownership Type"
    And I submit the form
    Then the vendor should be successfully updated
    And the vendor should have no tags

  @javascript
  Scenario: Edit vendor by adding and removing existing tag (happy)
    When I add a pre-existing vendor tag
    And I remove the pre-existing vendor tag
    And I submit the form
    Then the vendor should be successfully updated
    And the vendor should have its original tag

  @javascript
  Scenario: Edit vendor by adding and removing existing tag (happy)
    When I add a new vendor tag
    And I remove the new vendor tag
    And I submit the form
    Then the vendor should be successfully updated
    And the vendor should have its original tag

  @javascript
  Scenario: Fill edit vendor form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the volunteer-facing vendors index page
    And I should not see a success or error message

  @javascript
  Scenario: Fill edit vendor form, press cancel, but dismiss (happy)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the edit vendor page
    And I should see the vendor attributes filled in
  
  @javascript
  Scenario: Edit vendor with a bad picture (sad)
    When I include a bad picture
    And I submit the form
    Then I should see an error message on the edit vendor page
    And I should see the vendor attributes, except "picture", filled in

