        As an admin
        So that I can browse through the app and add/remote/update items or vendors
        I want to be able to access admin privileges when I log in until I log out

        Given I am logged in as "Asli"
        When I click on "ADMIN" link on the page
        Then I see "Hello Asli!" on the page
        When I click "Edit"
        Then I should see "Update Your Admin Login Information:" on the page
        And I fill "Name" as "NOT Asli"
        And I click "Update Admin"
        Then I should see "Admin was successfully updated." on the page
        And I should see "Hello NOT Asli!" on the page
        When I refresh the page, I should not see "Admin was successfully updated."
        Then I click on "Back to the Main Page"
        And I should be on the main page
        And I should see "ADMIN" link, "Add" button and "Logout" button
        When I click on "Logout" button
        I should not see "ADMIN" link on the page
        And I should not see "Add" button on the page
        And I should see "Login" button on the page