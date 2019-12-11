
Feature: Add new Admin
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