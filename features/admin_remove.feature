Feature: Admins should be able to remove admins from the control page

    As an admin
    So that I can remove other admin accounts
    I want to be able to access admin privileges when I log in until I log out

    Background: Logged in
        Given there are admins "Asli", "Asli1", "Asli2", and "Asli3"
        Given I am logged in as admin "Asli"
        When I go to URL "/seealladmins"
        Then I should see "Asli", "Asli1", "Asli2", "Asli3"

    Scenario: can't remove logged in admin
        When I click on "Remove" button for "Asli1"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should see "Asli", "Asli2", "Asli3" on the page
        And I should not see "Asli1" on the page

        When I click on "Remove" button for "Asli2"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should see "Asli", "Asli3" on the page
        And I should not see "Asli2" on the page

        When I click on "Remove" button for "Asli3"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should see "Asli" on the page
        And I should not see "Asli3" on the page

        When I click on "Remove" button for "Asli"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should see "You need to logout first to erase your current account."
        And I should see "Asli" on the page

    Scenario: can remove current account after login
        When I click on "Remove" button for "Asli"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should see "You need to logout first to erase your current account."
        And I should see "Asli" on the page
        When I click on 'Logout'
        Then I should be on discovery page
        When I go to '/seealladmins'
        When I click on "Remove" button for "Asli3"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should not see "Asli" on the page
