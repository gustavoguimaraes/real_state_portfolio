
Given /^I am on the new listing page$/ do
  visit new_admin_listing_path
end

When(/^I create a valid listing for a "(.*?)"$/) do |listing_type|
  fill_in "Code", with: "H-1234"
  select(listing_type, :from => "listing_listing_type")
  select("Available", :from => "listing_status")
  select( "1.5", :from => "listing_bedrooms")
  fill_in "Headline", with: "FABULOUS HOUSE"
  fill_in "Description", with: "Here is a house.  It is very nice."
  fill_in "Listing page headline", with: "Gus' House"
  fill_in "Listing page description", with: "It is very niiiiice."
  attach_file("Headline image", File.join(Rails.root,'features', 'fixtures', 'house.jpg'))
  fill_in "Street address", with: "111 fakestreet ave"
  fill_in "Cross streets", with: "Beverly st and Wavy ave"
  fill_in "City", with: "Queens"
  fill_in "State", with: "NY"
  fill_in "Zipcode", with: "11111"
  fill_in "Price", with: "8000"
  click_on "Create Listing"
end

Then /^I should see my new listing$/ do
  expect(page).to have_content("H-1234")
  expect(page).to have_content("FABULOUS HOUSE")
  expect(page).to have_content("Here is a house.  It is very nice.")
  expect(page).to have_content("Gus' House")
  expect(page).to have_content("It is very niiiiice.")
end

Then(/^I should see a listing with a code of "(.*?)"$/) do |code|
  expect(page).to have_content(code)
end

Given(/^I am on the rentals index page$/) do
  visit rentals_path
end

Then(/^I should see my new listing with bedroom and\/or address$/) do
  expect(page).to have_content("H-1234")
  expect(page).to have_content("FABULOUS HOUSE")
  expect(page).to have_content("Here is a house.  It is very nice.")
  expect(page).to have_content("Gus' House")
  expect(page).to have_content("111 fakestreet ave")
  expect(page).to have_content("Beverly st and Wavy ave")
  expect(page).to have_content("Queens")
  expect(page).to have_content("NY")
  expect(page).to have_content("11111")
  expect(page).to have_content("1.5")
end

Given(/^I am on a listing page$/) do
  @listing = FactoryGirl.create(:house, id: 1)
  visit admin_listing_path(@listing)
end

When(/^I click on schedule an open house$/) do
  click_button "Schedule"
end

Then(/^I should be able to pick an open house time and date$/) do
  fill_in "open_house[start_time_date]", with: "2014-05-16"
  fill_in "open_house[start_time_time_hour]", with: "02"
  fill_in "open_house[start_time_time_minute]", with: "00"
  fill_in "open_house[end_time_date]", with: "2014-05-16"
  fill_in "open_house[end_time_time_hour]", with: "04"
  fill_in "open_house[end_time_time_minute]", with: "00"
  click_on "Create Open house"
end

When(/^I click on edit listing$/) do
  click_link "Edit Listing"
end

When(/^I submit listing where I uncheck the publish option$/) do
  find(:css, "#listing_publish[value='1']").set(false)
  click_button('Update Listing')
end

When(/^I visit that listing page$/) do
  visit listing_path(@listing)
end

Then(/^I should see that the listing is not available$/) do
  expect(page).to have_content("This listing has been removed")
end

When(/^I go back to the home page$/) do
  visit root_path
end

Then(/^I should not see that listing$/) do
  headline = Listing.first.headline
  expect(page).not_to have_content(headline)
end

When(/^I submit listing with Sold status$/) do
  select("Sold", :from => "listing_status")
  click_on "Update Listing"
end

Then(/^I should see my new listing with Sold status$/) do
  expect(page).to have_content("Sold")
end

Then(/^I should see that listing with Sold status$/) do
  expect(page).to have_content("SOLD")
end

Then(/^I should see my new listing with the price$/) do
  expect(page).to have_content("8000")
end

When(/^I create a valid listing for a Rental House$/) do
  fill_in "Code", with: "R-1235"
  select("Rental House", :from => "listing_listing_type")
  select("Available", :from => "listing_status")
  select("Joe", :from => "listing_user_id")
  select( "1.5", :from => "listing_bedrooms")
  fill_in "Headline", with: "FABULOUS HOUSE"
  fill_in "Description", with: "Here is a house.  It is very nice."
  fill_in "Listing page headline", with: "Gus' House"
  fill_in "Listing page description", with: "It is very niiiiice."
  attach_file("Headline image", File.join(Rails.root,'features', 'fixtures', 'house.jpg'))
  fill_in "Street address", with: "111 fakestreet ave"
  fill_in "Cross streets", with: "Beverly st and Wavy ave"
  fill_in "City", with: "Queens"
  fill_in "State", with: "NY"
  fill_in "Zipcode", with: "11111"
  fill_in "Price", with: "8000"
  click_on "Create Listing"
end

Then(/^I should see my new listing with my contact information$/) do
  expect(page).to have_content("Joe")
end
