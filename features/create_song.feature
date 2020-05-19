@javascript
Feature: Create song

        Scenario: Add first song
            Given I navigate to the songs page
             When I click the "add" button
             Then I expect to see a modal for adding a new song

        Scenario: Create a song
            Given I am adding a new song
             When I fill in "Titel" with "A good song"
              And I click "Opslaan"
             Then I expect to see 1 song
