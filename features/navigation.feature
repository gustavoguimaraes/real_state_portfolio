Feature: Navbar
  As a visitor
  I need a nav bar
  So that I can visit different sections of the site.

  Scenario: Click the different links on the Navbar
    Given I am a visitor
    And there are listings of all types
    And I am on the sales page
    When I click on the "Rentals" button in the navigation
    Then I should see rental listings
    When I click on the "Sales" button in the navigation
    Then I should see sales listings
    When I click on the "Contact" button in the navigation
    Then I should see broker directory

