@javascript
Feature: Search songs
        Background:
            Given I have created the following users:
                  | email            | name | role    |
                  | gene@example.org | Gene | student |
                  | paul@example.org | Paul | student |
              And I have created the following songs:
                  | title             | tag_list   |
                  | Firehouse         | rock       |
                  | Deuce             | rock       |
                  | Cold Gin          | blues      |
                  | Lick It Up        | pop        |
                  | Tears are Falling | pop, blues |
              And I have created the following scores:
                  | song | tablature_notation | standard_notation | chord_notation |
                  | Firehouse  | true               | true              |                |
                  | Deuce      |                    | true              |                |
                  | Cold Gin   |                    |                   | true           |

              And I signed in as "gene@example.org"
             When I navigate to the songs page

        Scenario: Search for tagged songs
             When I search for songs tagged with "pop, rock"
             Then I expect to see the songs "Firehouse, Cold Gin"
              And I see the search form displaying "pop"

        Scenario: Search for notation
             When I search for songs with notation "tablature, standard"
             Then I expect to see the songs "Firehouse, Deuce"
              And I expect not to see the songs "Cold Gin, Lick It Up, Tears are Falling"