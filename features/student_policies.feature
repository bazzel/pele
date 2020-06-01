@javascript
Feature: Student policies
        Scenario: Student doesn't have a 'Gebruikers' menu
            Given I have created the following users:
                  | email                | name     | role    |
                  | jane.doe@example.org | Jane Doe | student |
            Given I signed in as "jane.doe@example.org"
              And I open the navigation drawer
             Then I expect not to see a "Gebruikers" menu-item

        Scenario: Student can't navigate to /users
            Given I have created the following users:
                  | email                | name     | role    |
                  | jane.doe@example.org | Jane Doe | student |
            Given I signed in as "jane.doe@example.org"
             When I navigate to "/users"
             Then I expect to see a message that I am not authorized

        Scenario: Student can't add new songs
            Given I have created the following users:
                  | email                | name     | role    |
                  | jane.doe@example.org | Jane Doe | student |
            Given I signed in as "jane.doe@example.org"
            Given I navigate to the songs page
             Then I expect not to see the "add" button

        Scenario: Student can't edit songs
            Given I have created the following users:
                  | email                | name     | role    |
                  | jane.doe@example.org | Jane Doe | student |
              And I have created the following songs:
                  | title       |
                  | A good song |
              And I signed in as "jane.doe@example.org"
             When I navigate to the songs page
              And I hover over the song "A good song"
             Then I expect not to see the "create" button
              And I expect not to see the "delete" button