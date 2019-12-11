Feature: Admins should be able to use sessions until they logout

    As an admin
    So that I can browse through the app and add/remote/update items or vendors and can edit admin information
    I want to be able to access admin privileges when I log in until I log out

    Background: Logged in
        Given I am logged in as an admin "Asli"

    Scenario: See and edit admin information
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Edit"
        Then I should see "Update Your Admin Login Information:" on the page
        And I fill Name as "NOT Asli"
        And I click "Update Admin"
        Then I should see "Admin was successfully updated." on the page
        And I should see "Hello NOT Asli!" on the page

    Scenario: Back to Main page
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Back to the Main Page"
        Then I should be on discovery page
        And I should see 'Logout' button on the navigation bar

    Scenario: Back to Admin page
        When I click on "ADMIN" link on the page
        Then I should see "Hello Asli!" on the page
        When I click "Edit"
        Then I should see "Update Your Admin Login Information:" on the page
        When I click 'Back to My Admin Page'
        Then I should see "Hello Asli!" on the page

    Scenario: See admin information
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Edit"
        Then I should see "Update Your Admin Login Information:" on the page
        When I click 'Back to Main Page'
        Then I should be on discovery page


    Scenario: Access new forms
        And I go to '/my_products/new' page
        Then I see New Product form

    Scenario: Shouldn't access forms if logged out
        When I click 'Logout'
        Then I should be on discovery page
        And I go to '/my_products/new' page
        Then I should be on products page
