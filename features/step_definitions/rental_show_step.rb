Given(/^I am on a rental index page$/) do
  visit rentals_path
end

Given(/^I click on view$/) do
  click_on "View on site"
end

Then(/^I should see the agent contact info$/) do
 expect(page).to have_content("Joe")
 expect(page).to have_content("123-456-7890")
end