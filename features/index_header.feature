Feature: Navigate customer-facing index page with navbar
  
  Background:
    Given I am on the discovery page
    
  Scenario: Click on home link in navbar
    When I follow "Home"
    Then I should be on the discovery page
  
  Scenario: Click on vendors link in navbar
    When I follow "Vendors"
    Then I should be on the customer-facing vendors index page
    
  Scenario: Click on products link in navbar
    When I follow "Products"
    Then I should be on the customer-facing products index page
    
#  Scenario: Click on tags link in navbar
#    When I follow "Tags"
#    Then I should be on the customer-facing tags index page
  
  Scenario: Click on picture in navbar
    When I follow "logo"
    Then I should be on the discovery page