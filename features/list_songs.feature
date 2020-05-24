Feature: List songs
        Background:
            Given I signed in

        Scenario: List songs
            Given I have 10 songs
             When I navigate to the songs page
             Then I expect to see 10 songs