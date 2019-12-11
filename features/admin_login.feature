Feature: Login as an admin

    As an admin
    I want to be able to login, view forms and logout
    So that I can exert my admin privileges

    Background: There is one admin
        Given I am not logged in
        Given there are no admin accounts exists
        Then I go to The Admins Control page
        When I press "Add New Admin"
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"
        Then I go to the Discovery page

    Scenario: Successful login with submit from main page(happy)
        When I press "Login"
        Then I am on the Admin Welcome page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I press "Login"
        Then I should be on the Discovery page
        And I should see "ADMIN"

    Scenario: Unsuccessful login (sad)
        When I press "Login"
        Then I am on the Admin Welcome page
        And I fill in "Name" with "Not Admin"
        And I fill in "Password" with "4321"
        And I press "Login"
        Then I should see "Name or password is invalid"
        And I am on the Admin Welcome page

    Scenario: Cancel login without putting on anything
        When I press "Login"
        Then I am on the Admin Welcome page
        When I follow "Cancel"
        Then I am on the Discovery page

    Scenario: Cancel login after typing
        When I press "Login"
        Then I am on the Admin Welcome page
        And I fill in "Name" with "Not Admin"
        And I fill in "Password" with "4321"
        When I follow "Cancel"
        Then I am on the Discovery page