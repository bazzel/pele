@javascript
Feature: Edit a group

        Background:
            Given I have created the following users:
                  | email           | name | role    |
                  | ace@example.org | Ace  | teacher |
              And I signed in as "ace@example.org"

        Scenario: Opening a modal for editing a group
            Given I have created the following group:
                  | name    | teacher         |
                  | Group 1 | ace@example.org |
              And I navigate to the groups page
              And I hover over the group "Group 1"
             When I click the "create" button
             Then I expect to see a page for editing the group
             When I fill in "Naam" with "Groep 1"
              And I click "Opslaan"
             Then I expect to see 1 group
