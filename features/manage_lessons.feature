@javascript
Feature: Manage lessons

        @wip
        Scenario: Add lesson on edit page
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
              And I have created the following songs:
                  | title       |
                  | Firehouse |
                  | Deuce |
                  | Cold Gin |
              And I have created the following group:
                  | name    | teacher         |
                  | Group 1 | ace@example.org |
              And I signed in as "ace@example.org"
              And I am editing the group "Group 1"
             When I add the song "Deuce"
              And I add the song "Cold Gin"
              And I click "Opslaan"
             Then I expect to see the songs "Deuce, Cold Gin" have been added to the group "Group 1"



        