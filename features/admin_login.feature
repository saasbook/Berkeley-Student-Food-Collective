Feature: Login as an admin

    As an admin
    I want to be able to login, view forms and logout
    So that I can exert my admin privileges

    Background: There is one admin
        Given I am not logged in
        Given there is an admin with name "Asli" and password "1234"

    Scenario: Successful login with submit from main page(happy)
        Given I am on the discovery page
        When I click on 'Login'
        Then I see the welcome admin page
        Then I enter Name as "Asli" and Password as "1234"
        And I click "Login"
        Then I should see the admin discovery page
        And I should see 'Logout' button on navigation bar
        And I should see 'Admin' link on navigation bar

    Scenario: Successful login with submit from vendors (happy)
        Given I am on the vendors page
        When I click on 'Login'
        Then I see the welcome admin page
        Then I enter Name as "Asli" and Password as "1234"
        And I click "Login"
        Then I should see the admin discovery page
        And I should see 'Logout' button on navigation bar
        And I should see 'Admin' link on navigation bar

    Scenario: Successful login with submit from products (happy)
        Given I am on the products page
        When I click on 'Login'
        Then I see the welcome admin page
        Then I enter Name as "Asli" and Password as "1234"
        And I click "Login"
        Then I should see the admin discovery page
        And I should see 'Logout' button on navigation bar
        And I should see 'Admin' link on navigation bar

    Scenario: Unsuccessful login (sad)
        When I click on 'Login'
        Then I see the welcome admin page
        Then I enter my name as "Not Admin" and password "4321"
        And I click "Login"
        Then I should see "Name of password is invalid" alert
        And I should see welcome admin page
        And I should see 'Login' on navigation bar

    Scenario: Cancel login without putting on anything
        When I click on 'Login'
        Then I see the welcome admin page
        When I click 'Cancel'
        Then I am on discovery page

    Scenario: Cancel login after typing
        When I click on 'Login'
        Then I see the welcome admin page
        Then I fill name as 'whatever' and password as '123'
        When I click 'Cancel'
        Then I am on discovery page