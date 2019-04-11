Feature: View and Interact with a Carousel of Products and Vendors

  As a customer
  In order to discover new products in a category
  I want to see a carousel of vendors or products with the same tag on the discovery page

  Scenario: Hover Interaction with Carousel (happy)
  	Given I hover over a carousel element
	Then the element should become larger
	And the other elements should slide to accommodate the bigger element