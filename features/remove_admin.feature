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



        Given there are admins "Asli", "Asli1", "Asli2", and "Asli3"
        Given I am logged in as admin "Asli"
        When I go to URL "/seealladmins"
        Then I should see "Asli", "Asli1", "Asli2", and "Asli3"
        And I should see 4 "Remove" buttons
        When I click on "Remove" button for "Asli1"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should not see "Asli1" on the page
        When I click on "Remove" button for "Asli2"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should not see "Asli2" on the page
        When I click on "Remove" button for "Asli3"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should not see "Asli3" on the page
        When I click on "Remove" button for "Asli"
        Then I should see an alert "Are you sure?"
        And I click "OK"
        Then I should see "You need to logout first to erase your current account."
        And I should see "Asli" on the page



        As a user without admin privileges
        I should not be able to access any data manipulating pages even if I put the url down directly through '../new' addresses

        When I am logged in as an admin "Asli"
        And I go to '/my_products/new' page
        Then I see New Product form

        When I am not logged in as an admin
        And I go to '/my_products/new' page
        Then I don't see 'New Product' form.
        And I get redirected to the 'my_products' index page.