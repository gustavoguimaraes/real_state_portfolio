Feature: Sale show
  As a visitor
  I need to view a sale listing page
  So I can see more info about the listing

  Scenario: View the sales show page
    Given I am a visitor
    And there are listings
    And I am on the sales index page
    When I click on a "Sales" headline link
    Then I should see that listing "Sales" show page