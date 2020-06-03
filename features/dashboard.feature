@javascript
Feature: Dashboard
        Background:
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
                  | gene@example.org | Gene | student |
                  | paul@example.org | Paul | student |
              And I have created the following groups:
                  | name     | teacher         | students                           |
                  | Masked   | ace@example.org | gene@example.org, paul@example.org |
                  | Unmasked | ace@example.org | gene@example.org, paul@example.org |
              And I have created the following songs:
                  | title             |
                  | Firehouse         |
                  | Deuce             |
                  | Cold Gin          |
                  | Lick It Up        |
                  | Tears are Falling |
              And I have create the following lessons:
                  | group    | song       |
                  | Masked   | Firehouse  |
                  | Masked   | Cold Gin   |
                  | Unmasked | Lick It Up |
             When I signed in as "gene@example.org"

        Scenario: Show groups and lessons
             Then I expect to see the songs "Firehouse, Cold Gin" in the group "Masked"
             Then I expect to see the songs "Lick It Up" in the group "Unmasked"

        Scenario: Filter pinned songs and lessons
              And I hover over the song "Firehouse"
             When I click the "push_pin" button
             When I switch the pin button on
             Then I expect to see the song "Firehouse" in the group "Masked"
              But I expect not to see the song "Cold Gin" in any group
              And I expect not to see the song "Lick It Up" in any group

