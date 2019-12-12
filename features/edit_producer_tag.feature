Feature: Add a new producer tag to the database

  As a admin
  I want to edit an existing producer tag

  Background:
    Given I am logged in as an admin
    And A producer tag exist

  @javascript
  Scenario: Edit producer tag (happy)

    When I go to the new producer tag page
    And I fill in "Name" with "Producer Tag"
    And I fill in "Description" with "Hello"
    And I fill in "Link to Picture" with "https://media2.s-nbcnews.com/j/newscms/2018_20/1339477/puppy-cute-today-180515-main_a936531048fdb698635dd1b418abdee9.fit-760w.jpg"
    Then I submit the form
    Then I go to the Discovery page
    Then I go to the producer tag page
    And I should see an edit button
    When I go to the edit producer tag page
    Then the "Name" field should contain "Producer Tag"
    When I fill in "Name" with "Producer Tag 2"
    Then I submit the form



