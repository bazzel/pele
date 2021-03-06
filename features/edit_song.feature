@javascript
Feature: Edit a song
        Background:
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
              And I signed in as "ace@example.org"

        Scenario: Opening a modal for editing a song
            Given I have created the following songs:
                  | title       |
                  | A good song |
              And I navigate to the songs page
              And I hover over the song "A good song"
             When I click the "create" button
             Then I expect to see a page for editing the song
             When I fill in "Titel" with "A very good song"
              And I click "Opslaan"
             Then I expect to see 1 song
