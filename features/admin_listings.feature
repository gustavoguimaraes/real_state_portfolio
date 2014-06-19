Feature: Listings
  As an admin
  I need to be able to create a listing
  So that I may display information about it on the website.

  Scenario: Add a listing with required fields
    Given I am an admin
    And I am on the new listing page
    When I create a valid listing for a "House"
    Then I should see my new listing

  @javascript
  Scenario: Add an agent to a rental listing
    Given I am an admin
    And I am on the new listing page
    When I create a valid listing for a Rental House
    Then I should see my new listing with my contact information
    When I click on view
    Then I should see the agent contact info
    When I am on the rentals index page
    Then I should see the agent contact info


  Scenario: Add a listing with required fields plus address and/or bedrooms
    Given I am an admin
    And I am on the new listing page
    When I create a valid listing for a "House"
    Then I should see my new listing with bedroom and/or address

  Scenario: Add a listing with required fields plus neighborhood
    Given I am an admin
    And there is a neighborhood
    And I am on the new listing page
    When I choose the neighborhood
    And I create a valid listing for a "House"
    Then I should see my new listing with the neighborhood

  Scenario: Set the price to a listing
    Given I am an admin
    And I am on the new listing page
    When I create a valid listing for a "House"
    Then I should see my new listing with the price

  Scenario: Schedule an open house
    Given I am an admin
    And I am on a listing page
    When I click on schedule an open house
    Then I should be able to pick an open house time and date

  Scenario: Set Unpublished option for listing
    Given I am an admin
    And I am on a listing page
    When I click on edit listing
    And I submit listing where I uncheck the publish option
    When I visit that listing page
    Then I should see that the listing is not available
    When I go back to the home page
    Then I should not see that listing

  Scenario: Set Sold status for listing
    Given I am an admin
    And I am on a listing page
    When I click on edit listing
    And I submit listing with Sold status
    Then I should see my new listing with Sold status
    When I go back to the home page
    Then I should see that listing with Sold status