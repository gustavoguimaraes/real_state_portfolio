Feature: Sales Pages
  As a visitor
  I need to see all of the sales listings
  So that I might buy one

  Scenario: View the sales index
    Given I am a visitor
    And there is a "House" listing with a code of "H-1234"
    And I am on the sales index page
    Then I should see a listing with a code of "H-1234"
