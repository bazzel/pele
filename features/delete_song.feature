@javascript
Feature: Delete a song
        Background:
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
              And I signed in as "ace@example.org"

        Scenario: Delete a song
            Given I have created the following songs:
                  | title         |
                  | A good song   |
                  | A better song |
              And I navigate to the songs page
              And I hover over the song "A good song"
             When I click the "delete" button
             Then I expect to see 1 song

        Scenario: Undo deleting a song
            Given I have created the following songs:
                  | title         |
                  | A good song   |
                  | A better song |
              And I navigate to the songs page
              And I hover over the song "A good song"
             When I click the "delete" button
              And I undo deleting the song
             Then I expect to see 2 songs
