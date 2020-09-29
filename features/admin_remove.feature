Feature: Admins should be able to remove admins from the control page

    As an admin
    So that I can remove other admin accounts
    I want to be able to access admin privileges when I log in until I log out

    Background: Logged in
        Given there no admin accounts exist
        And I go to The Admins Control page
        When I press "Add New Admin"
        And I fill in "Name" with "Asli"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"

        And I go to The Admins Control page
        When I press "Add New Admin"
        And I fill in "Name" with "Asli1"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"

        And I go to The Admins Control page
        When I press "Add New Admin"
        And I fill in "Name" with "Asli2"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"

        And I go to The Admins Control page
        When I press "Add New Admin"
        Then I should be on New Admin Signup page
        And I fill in "Name" with "Asli3"
        And I fill in "Password" with "1234"
        And I fill in "Password confirmation" with "1234"
        When I press "Create Admin"

        Given I am not logged in
        When I press "Login"
        Then I am on the Admin Welcome page
        And I fill in "Name" with "Asli3"
        And I fill in "Password" with "1234"
        And I press "Login"

        Then I go to The Admins Control page
        Then I should see "Asli"
        And I should see "Asli1"
        And I should see "Asli2"
        And I should see "Asli3"


    @javascript
    Scenario: can't remove logged in admin
        When I remove the first admin
        Then I should see "Asli1"
        Then I should see "Asli2"
        Then I should see "Asli3"
        And I should see "Admin was successfully deleted."
        And I should not see "Asli "

        When I remove the first admin
        Then I should see "Asli2"
        And I should see "Asli3"
        And I should see "Admin was successfully deleted."
        And I should not see "Asli1"
        And I should not see "Asli "

        When I remove the first admin
        And I should see "Asli3"
        And I should see "Admin was successfully deleted."
        And I should not see "Asli2"
        And I should not see "Asli1"
        And I should not see "Asli "

        When I remove the first admin
        And I should see "Asli3"
        And I should not see "Admin was successfully deleted."
        Then I should see "You need to logout first to erase your current account."
        And I should not see "Asli2"
        And I should not see "Asli1"
        And I should not see "Asli "

    @javascript
    Scenario: can remove current account after login
        When I remove the first admin
        Then I should see "Asli1"
        Then I should see "Asli2"
        Then I should see "Asli3"
        When I remove the first admin
        Then I should see "Asli2"
        Then I should see "Asli3"
        When I remove the first admin
        Then I should see "Asli3"
        When I remove the first admin
        Then I should see "You need to logout first to erase your current account."
        And I should see "Asli3"
        Then I go to the Discovery page
        And I press "Logout"
        Then I should be on the Discovery page
        Then I go to The Admins Control page
        And I should see "Asli3"
        When I remove the first admin
        Then I should not see "Asli3"
