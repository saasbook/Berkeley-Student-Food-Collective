Feature: View the Index Page of Vendors

  As a customer
  I want to view an index page of all of the vendors
  So that I can see all of the vendors that are available

  Scenario: See the customer-facing vendors index page (happy)
    Given there are three vendors
    When I go to the customer-facing vendors index page
    Then I should see three vendors on the customer-facing page