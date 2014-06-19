
Given(/^I am on the sales page$/) do
  visit sales_path
end

Given(/^there are listings of all types$/) do
  FactoryGirl.create(:house)
  FactoryGirl.create(:condo)
  FactoryGirl.create(:coop)
  FactoryGirl.create(:rental)
end

When(/^I click on the "(.*?)" button in the navigation$/) do |action|
  within('.navigation') do
    click_on action
  end
end

# kill me when the rental page exists
Then(/^I should see rental listings$/) do
  expect(page).to have_content(Listing.rentals.first.headline)
end

Then(/^I should see sales listings$/) do
  expect(page).to have_content(Listing.houses.first.headline)
end

When(/^there should be a contact email link$/) do
  within('.navigation') do
    expect(page).to have_xpath("//a[contains(@href,mailto)]", text: "Contact")
  end
end

Then(/^I should see broker directory$/) do
  expect(page).to have_content("Broker Directory")
end