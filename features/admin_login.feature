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

        Given I am an admin
        When I go to URL "/seealladmins"
        Then I should see "The Admins Control"
        When I click on "Add New Admin" button
        Then I should see alert "New Admin" form
        And I fill name "Asli" and password "1234"
        And I click "Create Admin"
        And I should see "Admin was successfully created."
        And I should see "Hello Asli!"
        When I refresh the page, I shouldn't see "Admin was successfully created."
        And I should see "Hello Asli!"


        As a user without admin privileges
        I should not be able to access any data manipulating pages even if I put the url down directly through '../new' addresses

        When I am logged in as an admin "Asli"
        And I go to '/my_products/new' page
        Then I see New Product form

        When I am not logged in as an admin
        And I go to '/my_products/new' page
        Then I don't see 'New Product' form.
        And I get redirected to the 'my_products' index page.