Feature: View the index pages

  As a customer
  I want to view index pages of all of the vendors, products, and tags
  So that I can see all of the vendors, products, and tags that are available

  Scenario: See the customer-facing vendors index page (happy)
    Given there are three vendors
    When I go to the customer-facing vendors index page
    Then I should see three vendors on the customer-facing page
    And I should see a letter navbar

  Scenario: See the customer-facing vendors index page on mobile (happy)
  	Given I am using a mobile device
    And there are three vendors
    When I go to the customer-facing vendors index page
    Then I should see three vendors on the customer-facing page
    And I should not see a letter navbar

  Scenario: See the customer-facing products index page (happy)
    Given there are three products
    When I go to the customer-facing products index page
    Then I should see three products on the customer-facing page
    And I should see a letter navbar

  Scenario: See the customer-facing products index page on mobile (happy)
    Given I am using a mobile device
    And there are three products
    When I go to the customer-facing products index page
    Then I should see three products on the customer-facing page
    And I should not see a letter navbar

  Scenario: See the volunteer-facing tags index page (happy)
    Given there exist three tags of type "nutrition"
    When I go to the volunteer-facing tags page
    Then I should see three tags on the volunteer-facing page
    And I should see a letter navbar

  Scenario: See the volunteer-facing tags index page on mobile (happy)
    Given I am using a mobile device
    And there exist three tags of type "nutrition"
    When I go to the volunteer-facing tags page
    Then I should see three tags on the volunteer-facing page
    And I should not see a letter navbar
