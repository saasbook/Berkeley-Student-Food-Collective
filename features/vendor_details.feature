Feature: View the Details Page of a Vendor

  As a customer
  I want to view the details of a vendor
  So that I can see all of the information about a vendor

Scenario: See the customer-facing vendor details page (happy)
    Given a vendor already exists
    When I go to the customer-facing vendor detail page
    Then I should see the photo, mission, story, and social media of the vendor