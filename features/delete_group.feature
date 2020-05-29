@javascript
Feature: Delete a group
        Background:
            Given I have created the following users:
                  | email           | name | role    |
                  | ace@example.org | Ace  | teacher |
              And I signed in as "ace@example.org"

        Scenario: Delete a group
            Given I have created the following group:
                  | name    | teacher         |
                  | Group 1 | ace@example.org |
                  | Group 2 | ace@example.org |
              And I navigate to the groups page
              And I hover over the group "Group 1"
             When I click the "delete" button
             Then I expect to see 1 group

        Scenario: Undo deleting a song
            Given I have created the following group:
                  | name    | teacher         |
                  | Group 1 | ace@example.org |
                  | Group 2 | ace@example.org |
              And I navigate to the groups page
              And I hover over the group "Group 1"
             When I click the "delete" button
              And I undo deleting the group
             Then I expect to see 2 groups
