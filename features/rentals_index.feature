Feature: Rentals Pages
  As a visitor
  I need to see all of the rentals listings
  So that I might lease one

  Scenario: View the rentals index
    Given I am a visitor
    And there is a "Rental House" listing with a code of "R-1234"
    And I am on the rentals index page
    Then I should see a listing with a code of "R-1234"
