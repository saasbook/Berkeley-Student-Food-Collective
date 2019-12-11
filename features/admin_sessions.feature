Feature: Admins should be able to use sessions until they logout

    As an admin
    So that I can browse through the app and add/remote/update items or vendors and can edit admin information
    I want to be able to access admin privileges when I log in until I log out

    Background: Logged in
        Given I am logged in as an admin "Asli"

    Scenario: See admin information
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Edit"
        Then I should see "Update Your Admin Login Information:" on the page
        And I fill Name as "NOT Asli"
        And I click "Update Admin"
        Then I should see "Admin was successfully updated." on the page
        And I should see "Hello NOT Asli!" on the page

    Scenario: See admin information
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Back to the Main Page"
        Then I should be on discovery page

    Scenario: See admin information
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Edit"
        Then I should see "Update Your Admin Login Information:" on the page
        When I click 'Back to My Admin Page'

    Scenario: See admin information
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Edit"
        Then I should see "Update Your Admin Login Information:" on the page
        When I click 'Back to Main Page'
        Then I should be on discovery page


        When I am logged in as an admin "Asli"
        And I go to '/my_products/new' page
        Then I see New Product form

        When I am not logged in as an admin
        And I go to '/my_products/new' page
        Then I don't see 'New Product' form.
        And I get redirected to the 'my_products' index page.

        Then I click on "Back to the Main Page"
        And I should be on the main page
        And I should see "ADMIN" link, "Add" button and "Logout" button
        When I click on "Logout" button
        I should not see "ADMIN" link on the page
        And I should not see "Add" button on the page
        And I should see "Login" button on the page