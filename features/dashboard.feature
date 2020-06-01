@javascript
Feature: Dashboard

        @wip
        Scenario: Show groups and lessons
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
                  | gene@example.org | Gene | student |
                  | paul@example.org | Paul | student |
              And I have created the following groups:
                  | name    | teacher         | students                           |
                  | Masked | ace@example.org | gene@example.org, paul@example.org |
                  | Unmasked | ace@example.org | gene@example.org, paul@example.org |
              And I have created the following songs:
                  | title     |
                  | Firehouse |
                  | Deuce     |
                  | Cold Gin  |
                  | Lick It Up |
                  | Tears are Falling |
              And I have create the following lessons:
                  | group | song |
                  | Masked | Firehouse |
                  | Masked | Cold Gin |
                  | Unmasked | Lick It Up|
             When I signed in as "gene@example.org"
             Then I expect to see the songs "Firehouse, Cold Gin" in the group "Masked"
             Then I expect to see the songs "Lick It Up" in the group "Unmasked"
