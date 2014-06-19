Given(/^there is a neighborhood$/) do
  FactoryGirl.create(:neighborhood)
end

When(/^I choose the neighborhood$/) do
  select("Park Slope", from: "listing_neighborhood_id")
end

Then(/^I should see my new listing with the neighborhood$/) do
  expect(page).to have_content("Park Slope")
end