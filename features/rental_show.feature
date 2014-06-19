Feature: Rental show
  As a visitor
  I need to view a rental listing page
  So I can see more info about the listing

  Scenario: View the rental show page
    Given I am a visitor
    And there are listings
    And I am on a rental index page
    When I click on a "Rental" headline link
    Then I should see that listing "Rental" show page

