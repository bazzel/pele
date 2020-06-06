@javascript
Feature: Create song
        Background:
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
              And I signed in as "ace@example.org"

        Scenario: Add first song
            Given I navigate to the songs page
             When I click the "add" button
             Then I expect to see a modal for adding a new song

        Scenario: Create a song
            Given I am adding a new song
             When I fill in "Titel" with "A good song"
              And I add the songwriter "S. Writer"
              And I add the tags "blues, rock"
              And I click "Opslaan"
             Then I expect to see 1 song
              And I expect to see the tags "blues, rock" for the song "A good song"
