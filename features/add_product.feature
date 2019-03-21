Feature: add a new product to the database

  As a volunteer
  I want to add a product to the DB
  So that customers can learn more about the product

  Scenario: successfully add new product (happy)
    Given I am on the New Product page
    And I fill in the New Product form
    When I press "submit_button"
    Then the DB should be updated with the new product

