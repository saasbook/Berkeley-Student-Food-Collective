Feature: Add a new producer tag to the database

  As a admin
  I want to add the information for the landing pages to the DB
  So that customers can see the correct picture and description for each page

  Background:
    Given I am not logged in

  Scenario: Visit landing page (happy)
    And I go to the new landing page
    Then I should be on the discovery page
    Given I am logged in as an admin
    And I go to the new landing page
    And I press "Create Landing"
    Then I should be on the discovery page
    When I go to the new landing page
    And I click the Edit Previous button
    And I press "Update Landing"
    Then I should be on the discovery page
    When I go to the new landing page
    And I click the Edit Previous button
    And I click the Back to Main Page button
    Then I should be on the discovery page
    When I go to the new landing page
    And I click the Back to Main Page button
    Then I should be on the discovery page



