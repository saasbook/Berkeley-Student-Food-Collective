Feature: Add new admin account

    As an admin
    I want to be able to create new admin account
    So that I can exert my admin privileges

    Background: No admins yet
        Given there are no admin accounts
        When I go to "/seealladmins"
        Then I should see The Admins Control page
        And I should not see current admins

    Scenario: Add new admin (happy)
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        And I fill name as "Asli" and password as "1234"
        And I click "Create Admin"
        And I should see "Admin was successfully created." alert
        And I should see "Hello Asli!" on the page

    Scenario: Return to Main page from control
        When I click on 'Return to Main Page'
        Then I should be on discovery page

    Scenario: See added admins
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        And I fill name as "Asli" and password as "1234"
        And I click "Create Admin"
        And I should see "Admin was successfully created."
        And I should see "Hello Asli!"
        When I go to "/seealladmins"
        Then I should see The Admins Control page
        And I should see "Asli" in current admins

    Scenario: Can't add multiple admins with same name
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        And I fill name as "Asli" and password as "1234"
        And I click "Create Admin"
        And I should see "Admin was successfully created."
        And I should see "Hello Asli!"
        When I go to "/seealladmins"
        Then I should see The Admins Control page
        And I should see "Asli" in current admins
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        And I fill name as "Asli" and password as "12345"
        And I click "Create Admin"
        Then I should see 'Name has already been taken' error


    Scenario: Can have multiple admins
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        And I fill name as "Asli" and password as "1234"
        And I click "Create Admin"
        And I should see "Admin was successfully created."
        And I should see "Hello Asli!"
        When I go to "/seealladmins"
        Then I should see The Admins Control page
        And I should see "Asli" in current admins
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        And I fill name as "Asli2" and password as "12345"
        And I click "Create Admin"
        And I should see "Admin was successfully created."
        And I should see "Hello Asli2!"
        When I go to "/seealladmins"
        Then I should see The Admins Control page
        And I should see "Asli" in current admins
        And I should see "Asli2" in current admins


    Scenario: Back to see all admins from signup form
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        And I fill name as "Asli" and password as "1234"
        When I click on 'View All Admins'
        Then I should see The Admins Control page

    Scenario: Return to Main page from signup
        When I click on "Add New Admin" button
        Then I should see New Admin Signup form
        When I click on 'Back to Main Page'
        Then I should be on discovery page