Feature: View a Map with Clickable Pins

  As a customer
  I want to see where vendors are on a map
  So that I can see where vendors are located and see the vendor details

  Scenario: There should be no pins when there are no vendors
    Given I go to Maps
    Then I should see no pins on the map

  Scenario: Clicking on a valid vendor address should load that vendors map page
  	Given I am looking at a vendor page with a valid address
  	When I click on the valid address
  	Then I will be on that vendors map page

  Scenario: Clicking on an invalid vendor address should still load that vendors map page 
  	Given I am looking at a vendor page with an invalid address
  	When I click on the invalid address
  	Then I will be on that vendors map page