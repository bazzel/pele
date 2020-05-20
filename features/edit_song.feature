@javascript
Feature: Edit a song

        Scenario: Opening a modal for editing a song
            Given I have created the following songs:
                  | title       |
                  | A good song |
              And I navigate to the songs page
              And I hover over the song "A good song"
             When I click the "create" button
             Then I expect to see a modal with "A good song" as title
             When I fill in "Titel" with "A very good song"
              And I click "Opslaan"
             Then I expect to see 1 song
