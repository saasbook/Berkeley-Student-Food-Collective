Feature: View a Map with Clickable Pins

  As a customer
  I want to see where vendors are on a map
  So that I can see where vendors are located and see the vendor details

  Scenario: There should be no pins when there are no vendors
    Given I go to Maps
    Then I should see no pins on the map

  Scenario: There should be one pin on the map at the vendor location when there is one vendor
    Given that there is one vendor created with location "San Francisco, California"
    When I go to Maps
    Then I should see one pin on the map