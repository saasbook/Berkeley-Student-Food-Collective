Feature: View the Index Page of Tags

  As a volunteer
  I want to view an index page of all of the tags
  So that I can see all of the tags that are available


  Scenario: See the volunteer-facing tags index page (happy)
    Given there exist three tags of type "nutrition"
    When I go to the volunteer-facing tags page
    Then I should see three tags on the volunteer-facing page


  