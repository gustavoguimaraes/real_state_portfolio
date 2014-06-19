Feature: Rentals Pages
  As an admin
  I need add images to a listing
  So that I can show how beautiful the listing is

  Scenario: Add an image to a listing
    Given I am an admin
    And there is a "Rental House" listing with a code of "R-1234"
    And I am on that listings page
    When I click "Add Image"
    And I attach an image
    Then I should see my new image info
    When I delete image
    Then I should not see image info