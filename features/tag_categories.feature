Feature: View, Edit and connect tag category

    As a user
    I want to view and edit a tag category to the DB
    So that I can learn more about the product tags

    Scenario: View all tag categories
        Given I am logged in as an admin
        Given I visit the new tag category form
        And I fill in "Name" with "Cat1"
        And I fill in "Description" with "Hello"
        When I submit the form
        Then I visit the new tag category form
        And I fill in "Name" with "Cat2"
        And I fill in "Description" with "Hello2"
        When I submit the form
        Then I visit the new tag category form
        And I fill in "Name" with "Cat3"
        And I fill in "Description" with "Hello2"
        When I submit the form
        Then I should be on the Product Tag Categories page
        And I should see "Cat1"
        And I should see "Cat2"
        And I should see "Cat3"
        And I should not see "Cat4"


    @javascript
    Scenario: View all tags of a category
        Given I am logged in as an admin
        Given I create first tag category
        When I go to the new product tag page
        And I create 3 tags with first category
        When I go to the Product Tag Categories page
        And I should see "Tag Category"
        And I should see "Tag Category2"
        And I follow "Tag Category"
        Then I should be on the tag category page
        Then I should see "Related Tags"
        And I should see "Tag1"
        And I should see "Tag2"
        And I should see "Tag3"
        When I go to the Product Tag Categories page
        And I follow "Tag Category2"
        Then I should be on the tag category2 page
        And I should see "Tag4"


    Scenario: View category of a tag
        Given I am logged in as an admin
        Given I create first tag category
        When I go to the new product tag page
        And I create 3 tags with first category
        When I go to the Product Tag Categories page
        And I should see "Tag Category"
        And I follow "Tag Category"
        Then I should be on the tag category page
        Then I should see "Related Tags"
        And I should see "Tag1"
        And I should see "Tag2"
        And I should see "Tag3"
        When I follow "Tag1"
        Then I press "Tag Group: Tag Category"
        Then I should be on the tag category page


    @javascript
    Scenario: Edit category
        Given I am logged in as an admin
        Given I create first tag category
        When I go to the new product tag page
        And I create 3 tags with first category
        When I go to the Product Tag Categories page
        And I should see "Tag Category"
        And I follow "Tag Category"
        Then I should see "Edit"
        And I follow "Edit"
        Then I fill in "Description" with "New description"
        When I submit the form
        And I should see "New description"