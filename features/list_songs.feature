@javascript
Feature: List songs
        Background:
            Given I signed in

        Scenario: List songs
            Given I have 10 songs
             When I navigate to the songs page
             Then I expect to see 10 songs

        Scenario: Show more songs
            Given I have 50 songs
             When I navigate to the songs page
             Then I expect to see 25 songs
             When I scroll to the bottom of the page
             Then I expect to see 50 songs
