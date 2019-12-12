Feature: Add a new product tag to the database

  As a admin
  I want to add a product tag to the DB
  So that customers can learn more about the product

  Background:
    Given I am logged in as an admin

  Scenario: Add new product tag (happy)
    When I go to the new product tag page
    And I fill in "Name" with "Producer Tag"
    And I fill in "Description" with "Hello"
    And I fill in "Link to Picture" with "https://media2.s-nbcnews.com/j/newscms/2018_20/1339477/puppy-cute-today-180515-main_a936531048fdb698635dd1b418abdee9.fit-760w.jpg"
    When I submit the form
    Then I should see an error message


  @javascript
  Scenario: Fill new product tag, press cancel, and confirm (happy)
    Given I am logged in as an admin
    When I go to the new product tag page
    When I press "Cancel"
    And I confirm the popup
    Then I should be on the discovery page
    And I should not see a success or error message

  @javascript
  Scenario: Fill new product tag, press cancel, but dismiss (happy)
    Given I am logged in as an admin
    When I go to the new product tag page
    And I fill in "Name" with "Producer Tag 2"
    When I press "Cancel"
    And I dismiss the popup
    Then I should see the new product tag page
    And I should see the tag category attributes filled in


#  Scenario: Add new product tag (happy)
#    And I fill in "Name" with "Producer Tag"
#    And I fill in "Description" with "Hello"
#    And I fill in "Link to Picture" with "https://media2.s-nbcnews.com/j/newscms/2018_20/1339477/puppy-cute-today-180515-main_a936531048fdb698635dd1b418abdee9.fit-760w.jpg"
#    And I select an option from the drop down
#    When I submit the form
#    Then I go to the discovery page

