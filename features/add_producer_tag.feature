Feature: Add a new producer tag to the database

  As a admin
  I want to add a producer tag to the DB
  So that customers can learn more about the vendor

  Background:
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
    Given I visit the new producer tag form

  Scenario: Add new producer tag (happy)
    And I fill in "Name" with "Producer Tag"
    And I fill in "Description" with "Hello"
    And I fill in "Link to Picture" with "https://media2.s-nbcnews.com/j/newscms/2018_20/1339477/puppy-cute-today-180515-main_a936531048fdb698635dd1b418abdee9.fit-760w.jpg"
    When I submit the form
    Then I should be on the discovery page


  @javascript
  Scenario: Fill new producer tag, press cancel, and confirm (happy)
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the discovery page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new producer tag, press cancel, but dismiss (happy)
    And I fill in "Name" with "Producer Tag 2"
    When I press "Cancel"
    But I dismiss the popup
    Then I should see the new producer tag page
    And I should see the tag category attributes filled in
  

