Feature: Edit an existing vendor in the database

  As a admin
  I want to edit a vendor in the DB
  So that I can update vendor information or fix mistakes

@javascript
Scenario: Edit vendor (happy)
  Given I am logged in as an admin
  When I visit the new vendor form
  And I fill in "Name" with "V1"
  And I fill in "Story" with "Hello"
  And I submit the form
  Then I am redirected to the vendor detail page
  When I go to the vendor page
  Then I should see an edit button
  When I go to the edit vendor page
  Then the "Name" field should contain "V1"
  When I fill in "Name" with "Vendor 1"
  Then I submit the form
  When I go to the edit vendor page
  Then the "Name" field should contain "Vendor 1"

Scenario: Try to edit vendor when not logged in (sad)
  Given I am not logged in
  When I go to the edit vendor page
  Then I go to the customer-facing vendors index page
