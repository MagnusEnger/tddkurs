Feature: Using Sinatra with Capybara

  Scenario: main page
    When I go to the main page
    Then I should see the default greeting

  Scenario: search for books
    Given the following books:
      | id | title       |
      | 1  | ABC         | 
      | 2  | Alle barna  |
      | 3  | Bobseybarna |
    When I search for "A"
    Then I should see all the books starting with "A"
