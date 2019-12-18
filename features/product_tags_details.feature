Feature: View the Details Page of a Product Tag

  As a customer
  I want to view the details of a product tag
  So that I can see all of the information about a product

  Scenario: See the producer tag details page (happy)
    Given I am logged in as an admin
    Given I go to the new product tag page
    And I fill in "Name" with "Product Tag"
    And I fill in "Description" with "Hello"
    And I fill in "Link to Picture" with "https://media2.s-nbcnews.com/j/newscms/2018_20/1339477/puppy-cute-today-180515-main_a936531048fdb698635dd1b418abdee9.fit-760w.jpg"
    When I submit the form
    Then I should see an error message

  Scenario: See the producer tag details page without loging in (happy)
    Given I am not logged in
    And Landing already exist
    Given I go to the new product tag page
    Then I should be on the discovery page
    When I visit the all product tag page
    Then I should see the photo and description
    Then I go to the edit producer tag page
    Then I should be on the customer-facing vendors index page
