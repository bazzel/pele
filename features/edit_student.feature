@javascript
Feature: Edit a student
        Background:
            Given I have created the following users:
                  | email           | name | role    |
                  | ace@example.org | Ace  | teacher |
              And I signed in as "ace@example.org"


        Scenario: Opening a modal for editing a student
            Given I have created the following users:
                  | email                | name     | role    |
                  | jane.doe@example.org | Jane Doe | student |
              And I navigate to the users page
              And I hover over the user "Jane Doe"
             When I click the "create" button
             Then I expect to see a modal with "Jane Doe" as title
             When I fill in "Naam" with "Jane J. Doe"
              And I click "Opslaan"
             Then I expect to see 2 users
