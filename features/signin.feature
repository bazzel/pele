Feature:
  As a user
  I can log in
  so I can do authorized tasks

        Background:
            Given I have created the following users:
                  | email                |
                  | john.doe@example.org |


        Scenario: Show the sign in page
             When I open the application
             Then I expect to see the sign in page

        Scenario: Sign in with a valid email address
            Given I am on the Sign in page
             When I sign up with my email address "john.doe@example.org"
             Then "john.doe@example.org" should receive an email
              And I expect to see a page with instructions for "john.doe@example.org" how to login

        Scenario: Sign in with valid url
            Given I am on the Sign in page
              And I sign up with my email address "john.doe@example.org"
             When I use the magic link
             Then I'm in

        Scenario: Sign out
            Given I signed in with my email address "john.doe@example.org"
             When I sign out
             Then I'm out

        Scenario: Sign in with an unauthorized email address
            Given I am on the Sign in page
             When I sign up with my email address "stranger@example.org"
             Then I see an error telling me I have entered an invalid email address

        Scenario: Sign up without email address
            Given I am on the Sign in page
             When I sign up without an email address
             Then I see an error telling me I have entered an invalid email address

        Scenario: Sign up with an invalid email address
            Given I am on the Sign in page
              And I sign up with my email address "john.doe"
             Then I see an error telling me I have entered an invalid email address
