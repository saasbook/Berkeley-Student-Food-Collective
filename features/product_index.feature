Feature: View the Index Page of Products

  As a customer
  I want to view an index page of all of the products
  So that I can see all of the products that are available

Scenario: See the customer-facing products index page (happy)
    Given there are three products
    When I go to the customer-facing products index page
    Then I should see three products on the customer-facing page
