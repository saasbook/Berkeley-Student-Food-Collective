Feature: View and Interact with a Carousel of Products and Vendors

  As a customer
  In order to discover new products in a category
  I want to see a carousel of vendors or products with the same tag on the discovery page

  @javascript
  Scenario: Hover Slide Interaction with Carousel (happy)
  	Given I am on the Discovery page
  	And I hover over the third carousel element
	Then the left elements should shift to the left
	And the right elements should shift to the right
	
  Scenario: The vendor carousel for a given ownership type should exist (happy)
  	Given I am on the New Vendor page
  	When I create a new vendor
  	And I fill in the New Vendor form
  	And I add a new tag "Collective"
  	And I press "Create Vendor"

  	Given I am on the New Vendor page
  	When I create a new vendor
  	And I fill in the New Vendor form
  	And I add a new tag "Collective"
  	And I press "Create Vendor"

  	Given I am on the New Vendor page
  	When I create a new vendor
  	And I fill in the New Vendor form
  	And I add a new tag "Collective"
  	And I press "Create Vendor"
  	
