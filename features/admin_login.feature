Feature: Login as an Admin

    As an admin,
    I want to be able to login to BSFC webapp
    So I can make edits about vendors, products and tags

    Scenario: Login with an account
        Given an admin already exists
        And I am on the discovery page
        When I follow "Login"
        Then I should be on the volunteer-facing vendors index page
        And I should see a success message
        And no vendors should exist


    Scenario: Login without an account

        Given I am a client
        When I click on Login
        Then I enter my name and password
        And I click "Login"
        I should see alert "Name or Password incorrect"
        Then I click Cancel
        Then I get back to the main page

        Given I am an admin
        When I click on Login
        And I enter my name and password
        And I click "Login"
        I should see alert "Login Successful"
        Then I should see "ADMIN" link on navigation bar
        And I should see "Logout" button on navigation bar

