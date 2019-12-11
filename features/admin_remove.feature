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