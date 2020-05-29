@javascript
Feature: Create group
        Background:
            Given I have created the following users:
                  | email            | name | role    |
                  | ace@example.org  | Ace  | teacher |
                  | gene@example.org | Gene | student |
                  | paul@example.org | Paul | student |
              And I signed in as "ace@example.org"

        Scenario: Add first group
             When I choose "Groepen" from the navigation drawer
             When I click the "add" button
             Then I expect to see a modal for adding a new group

        Scenario: Create an empty group
            Given I am adding a new group
             When I fill in "Naam" with "Groep 1"
              And I click "Opslaan"
             Then I expect to see 1 group

        Scenario: Create a group
            Given I am adding a new group
             When I fill in "Naam" with "Groep 1"
              And I add the students "gene@example.org, paul@example.org"
              And I click "Opslaan"
             Then I expect to see 1 group
