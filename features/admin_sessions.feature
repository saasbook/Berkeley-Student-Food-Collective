Feature: Admins should be able to use sessions until they logout

    As an admin
    So that I can browse through the app and add/remote/update items or vendors and can edit admin information
    I want to be able to access admin privileges when I log in until I log out

    Background: Logged in
        Given there no admin accounts exist
        When I go to The Admins Control page
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"

        Given I am not logged in
        When I press "Login"
        Then I am on the Admin Welcome page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I press "Login"

    Scenario: See and edit admin information
        When I go to ADMIN
        Then I should see "Hello Asli!"
        When I follow "Edit"
        Then I should see "Update Your Admin Login Information:"
        And I fill in "Name" with "NOT Asli"
        And I press "Update Admin"
        Then I should see "Admin was successfully updated"
        And I should see "Hello NOT Asli!"

    Scenario: Back to Admin page
        When I go to ADMIN
        Then I should see "Hello Asli!"
        When I follow "Edit"
        Then I should see "Update Your Admin Login Information:"
        When I follow "Back to My Admin Page"
        Then I should see "Hello Asli!"

    Scenario: Back to Main page
        When I go to ADMIN
        Then I should see "Hello Asli!"
        When I follow "Back to the Main Page"
        Then I should be on the Discovery page
        When I press "Logout"
        Then I should be on the Discovery page
        When I press "Login"
        Then I should be on the Admin Welcome page

    Scenario: See admin information
        When I go to ADMIN
        Then I should see "Hello Asli!"
        When I follow "Edit"
        Then I should see "Update Your Admin Login Information:"
        When I follow "Back to Main Page"
        Then I should be on the Discovery page


    Scenario: Access new forms when still logged in
        And I go to new product page
        Then I should see "Select a Vendor"
        And I should see "Name"
        And I should see "Link to Picture"
        And I should see "Product Tags"

    Scenario: Shouldn't access forms if logged out
        When I press "Logout"
        Then I should be on the Discovery page
        And I go to new product page
        Then I should be on the customer-facing products index page
