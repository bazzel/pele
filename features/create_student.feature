@javascript
Feature: Create student
        Background:
            Given I signed in

        Scenario: Add first user
             When I choose "Gebruikers" from the navigation drawer
             When I click the "add" button
             Then I expect to see a modal for adding a new user

        Scenario: Create a user
            Given I am adding a new user
             When I fill in "Naam" with "John"
             When I fill in "E-mailadres" with "john@gmail.com"
              And I choose "Leerling" as "Rol"
              And I click "Opslaan"
             Then I expect to see 1 user
