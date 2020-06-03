@javascript
Feature: Pin songs

        Scenario: Pin song
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
                  | gene@example.org | Gene | student |
              And I have created the following groups:
                  | name   | teacher         | students         |
                  | Masked | ace@example.org | gene@example.org |
              And I have created the following songs:
                  | title             |
                  | Firehouse         |
                  | Tears are Falling |
              And I have create the following lessons:
                  | group  | song      |
                  | Masked | Firehouse |
             When I signed in as "gene@example.org"
             When I navigate to the songs page
              And I hover over the song "Tears are Falling"
             When I click the "push_pin" button
              And I navigate to the home page
             Then I expect to see the songs "Tears are Falling" as pinned song

        Scenario: Unpin song

        Scenario: View pinned songs