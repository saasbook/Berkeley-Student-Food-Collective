Feature: View the Index Page of Vendors

  As a customer
  I want to view an index page of all of the vendors
  So that I can see all of the vendors that are available

  Scenario: See the customer-facing vendors index page (happy)
    Given a vendor already exists
    Given there are 3 vendors
    When I go to the customer-facing vendors index page
    Then I should see 3 vendors on the customer-facing page