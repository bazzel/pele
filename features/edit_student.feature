@javascript
Feature: Edit a student

        @wip
        Scenario: Opening a modal for editing a student
            Given I have created the following users:
                  | name       | role |
                  | John Doe | student |
              And I navigate to the users page
              And I hover over the user "John Doe"
             When I click the "create" button
             Then I expect to see a modal with "John Doe" as title
             When I fill in "Naam" with "John J. Doe"
              And I click "Opslaan"
             Then I expect to see 1 user
