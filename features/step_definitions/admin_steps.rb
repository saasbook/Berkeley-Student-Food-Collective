When /^there no admin accounts exist$/ do
    Admin.destroy_all
end

Given /^I am not logged in$/ do
    visit path_to("logout")
end


Given /^admins "Asli", "Asli1", "Asli2", "Asli3 exist"$/ do 
    Given %{there no admin accounts exist}
    And %{I go to The Admins Control page}
    When %{I press "Add New Admin"}
    And %{I fill in "Name" with "Asli"}
    And %{I fill in "Password" with "1234"}
    And %{I fill in "Password confirmation" with "1234"}
    When %{I press "Create Admin"}

    And %{I go to The Admins Control page}
    When %{I press "Add New Admin"}
    And %{I fill in "Name" with "Asli1"}
    And %{I fill in "Password" with "1234"}
    And %{I fill in "Password confirmation" with "1234"}
    When %{I press "Create Admin"}

    And %{I go to The Admins Control page}
    When %{I press "Add New Admin"}
    And %{I fill in "Name" with "Asli2"}
    And %{I fill in "Password" with "1234"}
    And %{I fill in "Password confirmation" with "1234"}
    When %{I press "Create Admin"}

    And %{I go to The Admins Control page}
    When %{I press "Add New Admin"}
    Then %{I should be on New Admin Signup page}
    And %{I fill in "Name" with "Asli3"}
    And %{I fill in "Password" with "1234"}
    And %{I fill in "Password confirmation" with "1234"}
    When %{I press "Create Admin"}
end

Given /^I am logged in as admin "Asli3"$/ do
    When %{I press "Login"}
    Then %{I am on the Admin Welcome page}
    And %{I fill in "Name" with "Asli3"}
    And %{I fill in "Password" with "1234"}
    And %{I press "Login"}
end
