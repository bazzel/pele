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