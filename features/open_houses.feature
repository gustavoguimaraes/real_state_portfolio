Feature: Open Houses
  As a visitor
  I need to see when a listing has an upcoming open house
  So that I may visit a house and buy it

  Scenario: See a listing's upcoming open house
    Given I am a visitor
    And there is a listing with an open house today
    When I visit the sales page
    Then I should see that there is an Open House
    When I visit that listing sale page
    Then I should see the open house information