#complete
Feature: View the Details Page of a Vendor

  As a customer
  I want to view the details of a vendor
  So that I can see all of the information about a vendor

  Scenario: See the vendor details page (happy)
    Given a vendor already exists
    When I visit the vendor detail page
    Then I should see the photo and story of the vendor



  Scenario: See the vendor details page as admin (happy)
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
    Given a vendor already exists
    When I visit the vendor detail page
    Then I should see the photo and story of the vendor

  @javascript
  Scenario: New vendor form, then cancel(happy)
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
    Given I visit the new vendor form
    And I fill in "Name" with "V1"
    And I fill in "Story" with "Hello"
    When I press "Cancel"
    And I confirm the popup
    Then I am redirected to the vendor detail page
    And I should not see a success or error message


  @javascript
  Scenario: New vendor form, then cancel(happy)
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
    Given I visit the new vendor form
    And I fill in "Name" with "V1"
    And I fill in "Address" with "2725 Haste Street, Berkeley, CA 94704"
    And I fill in "Link to Picture" with "https://www.telegraph.co.uk/content/dam/Pets/spark/royal-canin/happy-puppy.jpg?imwidth=450"
    And I fill in "Facebook" with "https://www.facebook.com/"
    And I fill in "Twitter" with "https://www.twitter.com/"
    And I fill in "Instagram" with "https://www.instagram.com/"
    When I submit the form
    Then I am redirected to the vendor detail page
    Then I should see the photo and story of the vendor
    And I should not see a success or error message
