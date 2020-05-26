@javascript
Feature: Delete a group
        Background:
            Given I signed in

        Scenario: Delete a group
            Given I have created the following group:
                  | name    |
                  | Group 1 |
                  | Group 2 |
              And I navigate to the groups page
              And I hover over the group "Group 1"
             When I click the "delete" button
             Then I expect to see 1 group

        Scenario: Undo deleting a song
            Given I have created the following group:
                  | name    |
                  | Group 1 |
                  | Group 2 |
              And I navigate to the groups page
              And I hover over the group "Group 1"
             When I click the "delete" button
              And I undo deleting the group
             Then I expect to see 2 groups
