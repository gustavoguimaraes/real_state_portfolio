Given(/^there is a listing with an open house today$/) do
  @listing = FactoryGirl.create(:house, cross_streets: "sesame st and grand ave")
  @oh = FactoryGirl.create(:open_house, listing_id: @listing.id)
end

When(/^I visit the sales page$/) do
  visit root_path
end

Then(/^I should see that there is an Open House$/) do
  expect(page).to have_content("Open House")
end

When(/^I visit that listing sale page$/) do
  visit listing_path(@listing)
end

Then(/^I should see the open house information$/) do
  expect(page).to have_content(@listing.cross_streets)
  expect(page).to have_content(@oh.lead_page_time)
end