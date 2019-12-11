Feature: View a Map with Clickable Pins

	As a customer
	I want to see where vendors are on a map
	So that I can see where vendors are located and see the vendor details

	@javascript
	Scenario: There should be no pins when there are no vendors
		Given that there are no vendors
		When I click on maps in the drop down
		Then I should see no pins on the map

	@javascript
	Scenario: There should be one pin on the map at the vendor location when there is one vendor
		Given that there is one vendor created with location "San Francisco, California"
		When I click on maps in the dorp down
		Then I should see one pin on the map
		And the pin location should be near 37.7N and 122.4W

	@javascript
	Scenario: There should be three pins on the map at the vendor locations when there are three vendors
		Given that there are three vendors created with locations "San Francisco, California", "Los Angeles, California", and "San Diego, California"
		When I click on the maps in the drop down
		Then I should see the three pins on the map
		And there should be a pin at 37.77N and 122.4W
		And there should be a pin at 34.05N and 118.2W
		And there should be a pin at 37.7N and 117.16W

	@javascript
	Scenario: There should be an info window that pops up when a pin is clicked
		Given that there is one vendor created with location "San Francisco, California"
		When I click on maps in the drop down
		Then I should see one pin on the map
		And the pin location should be near 37.7N and 122.4W
		And when I click on a pin
		Then an info window should pop up

	@javascript
	Scenario: The info window should have a clickable link that redirects to the vendors page
		Given that there is one vendor created with location "San Francisco, California"
		When I click on maps in the drop down
		Then I should see one pin on the map
		And the pin location should be near 37.7N and 122.4W
		And when I click on the pin
		Then an info window should pop up
		And the info window should have a clickable link that redirects to the vendors page