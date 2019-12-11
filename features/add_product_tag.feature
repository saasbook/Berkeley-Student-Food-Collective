Feature: Add a new product tag to the database

  As a admin
  I want to add a product tag to the DB
  So that customers can learn more about the product

  Background:
    Given I fill the new product tags form

  Scenario: Add new product tag (happy)
    When I submit the form
    Then the producer tag should be successfully added
    And I should be on the discovery page


  @javascript
  Scenario: Fill new product tag form, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the discovery page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new product tag form, press cancel, but dismiss (happy)
    When I press "Cancel"
    But I dismiss the popup
    Then I should be on the new product tags page
    And I should see the product tag attributes filled in