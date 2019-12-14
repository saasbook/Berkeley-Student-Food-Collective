Feature: Add new admin account

    As an admin
    I want to be able to create new admin account
    So that I can exert my admin privileges

    Background: No admins yet
        Given there no admin accounts exist
        And I am on The Admins Control page

    Scenario: Add new admin (happy)
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"
        Then I should be on Admin Edit page
        Then I should see "Admin was successfully created."
        And I should see "Hello Asli!"

    Scenario: Return to Main page from control
        When I follow "Return to Main Page"
        Then I should be on the Discovery page

    Scenario: See added admins after adding an admin
        Then I should not see "Asli"
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"
        Then I should be on Admin Edit page
        Then I should see "Admin was successfully created."
        And I should see "Hello Asli!"
        When I go to The Admins Control page
        And I should see "Asli"


    Scenario: Can't add multiple admins with same name
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"
        Then I should be on Admin Edit page
        Then I should see "Admin was successfully created."
        And I should see "Hello Asli!"
        When I go to The Admins Control page
        And I should see "Asli"
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234567"
        And I fill in "Password confirmation" with "1234567"
        When I press "Create Admin"
        Then I should see "Name has already been taken"

    Scenario: Can't add new admin if passwords don't match
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "12"
        When I press "Create Admin"
        Then I should see "Password confirmation doesn't match Password"
        When I go to The Admins Control page
        Then I should not see "Asli"


    Scenario: Back to see all admins from signup form
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"

    Scenario: Return to Main page from signup
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        When I follow "Back to Main Page"
        Then I should be on the Discovery page

    Scenario: Possible to have multiple admins with different names
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        And I press "Create Admin"
        And I should see "Admin was successfully created."
        And I should see "Hello Asli!"
        When I go to The Admins Control page
        And I should see "Asli"
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli2"
        And I fill in "Password" with "12345"
        And I fill in "Password confirmation" with "12345"
        And I press "Create Admin"
        Then I should see "Admin was successfully created."
        And I should see "Hello Asli2!"
        Then I go to The Admins Control page
        And I should see "Asli"
        And I should see "Asli2"