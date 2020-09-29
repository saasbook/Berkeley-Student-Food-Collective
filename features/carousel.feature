Feature: View and Interact with a Carousel of Products and Vendors

    As a customer
    In order to discover new products in a category
    I want to see a carousel of vendors or products with the same tag on the discovery page

    Scenario: See products
        Given I create 5 products
        And I am on the Discovery page
        Then I should see "Tag1"
        And I should see "P1"
        And I should see "P2"
        And I should see "P3"
        And I should see "P4"
        And I should see "P5"
    Scenario: See vendors
        Given I create 5 vendors
        And I am on the Discovery page
        Then I should see "Producer Tag1"
        And I should see "V1"
        And I should see "V2"
        And I should see "V3"
        And I should see "V4"
        And I should see "V5"