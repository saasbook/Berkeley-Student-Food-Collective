Feature: View the index pages

  As a customer
  I want to view index pages of all of the vendors, products, producer tags, and product tags
  So that I can see all of the vendors, products, producer tags, and product tags that are available

  Scenario: See the customer-facing vendors index page (happy)
    Given there are three vendors
    When I go to the customer-facing vendors index page
    Then I should see three vendors on the customer-facing page
#    And I should see a letter navbar

#  Scenario: See the customer-facing vendors index page on mobile (happy)
#  	Given I am using a mobile phone
#    And there are three vendors
#    When I go to the customer-facing vendors index page
#    Then I should see three vendors on the customer-facing page
#    And I should not see a letter navbar

#  Scenario: See the customer-facing vendors index page on mobile (happy)
#    Given I am using a tablet
#    And there are three vendors
#    When I go to the customer-facing vendors index page
#    Then I should see three vendors on the customer-facing page
#    And I should not see a letter navbar

  Scenario: See the customer-facing products index page (happy)
    Given there are three products
    When I go to the customer-facing products index page
    Then I should see three products on the customer-facing page
#    And I should see a letter navbar

#  Scenario: See the customer-facing products index page on mobile (happy)
#    Given I am using a mobile phone
#    And there are three products
#    When I go to the customer-facing products index page
#    Then I should see three products on the customer-facing page
#    And I should not see a letter navbar

#  Scenario: See the customer-facing products index page on mobile (happy)
#    Given I am using a tablet
#    And there are three products
#    When I go to the customer-facing products index page
#    Then I should see three products on the customer-facing page
#    And I should not see a letter navbar

  Scenario: See the volunteer-facing product tags index page (happy)
    Given there exist three tags
    When I go to the volunteer-facing product tags page
    Then I should see three tags on the volunteer-facing page
#    And I should see a letter navbar

#  Scenario: See the volunteer-facing tags index page on mobile (happy)
#    Given I am using a mobile phone
#    And there exist three tags of type "nutrition"
#    When I go to the volunteer-facing tags page
#    Then I should see three tags on the volunteer-facing page
#    And I should not see a letter navbar

#  Scenario: See the volunteer-facing tags index page on mobile (happy)
#    Given I am using a tablet
#    And there exist three tags of type "nutrition"
#    When I go to the volunteer-facing tags page
#    Then I should see three tags on the volunteer-facing page
#    And I should not see a letter navbar
  
  Scenario: See the product tags index page (happy)
    Given a product already exists
    And there exist 2 tags
    When I go to the product tags page
    Then I should see a picture, description, and the product

  Scenario: See the producer tags index page (happy)
    Given a vendor already exists
    And there exist 2 tags
    When I go to the producer tags page
    Then I should see a picture, description, and the vendor

  Scenario: See the vendor details page (happy)
    Given a vendor already exists
    When I go to the vendor detail page
    Then I should see the photo, story, and social media of the vendor

#  Scenario: See the product tags index page (happy)
#    Given a vendor already exists
#    And there exist 5 tags
#    When I go to the product tags page
#    Then I should see 5 tags on the products tag page


  Scenario: See the product details page (happy)
    Given a product already exists
    When I go to the vendor detail page
    Then I should see the photo, and sotry