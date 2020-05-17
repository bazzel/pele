@javascript
Feature: Create song

  @wip
  Scenario: Add first song
    Given I navigate to the songs page
    When I click the "add" button
      Then I expect to see a modal for adding a new song