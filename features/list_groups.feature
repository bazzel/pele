Feature: List groups

        Scenario: Opening a modal for editing a group
            Given I have created the following users:
                  | email             | name  | role    |
                  | ace@example.org   | Ace   | teacher |
                  | peter@example.org | Peter | teacher |
            Given I have created the following group:
                  | name    | teacher           |
                  | Group 1 | ace@example.org   |
                  | Group 2 | peter@example.org |
              And I signed in as "ace@example.org"
              And I navigate to the groups page
             Then I expect to see 1 group
