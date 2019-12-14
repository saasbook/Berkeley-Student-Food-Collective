Feature: Edit an existing product tag in the database

  As a admin
  I want to edit a product tag in the DB
  So that I can update tag information or fix mistakes

@javascript
Scenario: Edit product tag as an admin (happy)
  Given I am logged in as an admin
  Given a product tag category already exists
  And a product tag already exists
  When I go to the edit product tag page
  And fill in "Name" with "Product Tag 1"
  Then I submit the form
  When I go to the edit product tag page
  Then the "Name" field should contain "Product Tag 1"

Scenario: Try to edit product tag when not logged in (sad)
  Given I am not logged in
  And a product tag category already exists
  And a product tag already exists
  When I go to the edit product tag page
  Then I go to the customer-facing vendors index page