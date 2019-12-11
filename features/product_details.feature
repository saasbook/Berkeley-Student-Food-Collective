Feature: View the Details Page of a Product

  As a customer
  I want to view the details of a product
  So that I can see all of the information about a product

  Scenario: See the product details page (happy)
    Given a vendor already exists
    Given a product already exists
    When I visit the product detail page
    Then I should see the photo and description

  Scenario: See the product details page as admin (happy)
    Given I am not logged in
    Given there are no admin accounts exists
    Then I go to The Admins Control page
    When I press "Add New Admin"
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I fill in "Password confirmation" with "123"
    When I press "Create Admin"
    Then I go to the Discovery page
    When I press "Login"
    Then I am on the Admin Welcome page
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I should be on the Discovery page
    And I should see "ADMIN"
    Given a product already exists
    When I visit the product detail page
    Then I should see the photo and story of the vendor

  @javascript
  Scenario: New product form, then cancel(happy)
    Given I am not logged in
    Given there are no admin accounts exists
    Then I go to The Admins Control page
    When I press "Add New Admin"
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I fill in "Password confirmation" with "123"
    When I press "Create Admin"
    Then I go to the Discovery page
    When I press "Login"
    Then I am on the Admin Welcome page
    And I fill in "Name" with "ikram"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I should be on the Discovery page
    And I should see "ADMIN"
    Given I visit the new product form
    And I fill in "Name" with "V1"
    And I fill in "Link to Picture" with "https://www.telegraph.co.uk/content/dam/Pets/spark/royal-canin/happy-puppy.jpg?imwidth=450"
    And I fill in "Description" with "This is a test"
    When I submit the form
    Then I should see an error message