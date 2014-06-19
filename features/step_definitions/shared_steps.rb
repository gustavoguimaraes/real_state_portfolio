Given(/^I am a visitor$/) do
  # done
end

Given(/^I am on the sales index page$/) do
  visit sales_path
end

Given(/^I am an admin$/)do
  @user = create(:user)
  login_as @user
end

Given(/^there is a "(.*?)" listing with a code of "(.*?)"$/) do |listing_type, code|
  @listing = FactoryGirl.create(:listing, listing_type: listing_type, code: code)
end

When(/^I pry$/) do
  binding.pry
end

Given(/^there are listings$/) do
  sale = FactoryGirl.create(:house, headline: "First Sales Headline")
  rental = FactoryGirl.create(:rental, headline: "First Rental Headline")
end

When(/^I click on a "(.*?)" headline link$/) do |listing_type|
  click_on("First #{listing_type} Headline")
end

Then(/^I should see that listing "(.*?)" show page$/) do |listing_type|
  expect(page).to have_content("First #{listing_type} Headline")
end
