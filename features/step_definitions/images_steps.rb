Given(/^I am on that listings page$/) do
  visit admin_listing_path(@listing)
end

When(/^I click "(.*?)"$/) do |link|
  click_on link
end

When(/^I attach an image$/) do
  attach_file("Gallery image", File.join(Rails.root,'features', 'fixtures', 'house.jpg'))
  click_button "Create Image"
end

Then(/^I should see my new image info$/) do
  expect(page).to have_css('.image')
end

When(/^I delete image$/) do
  within '.image' do
    click_on 'Delete'
  end
end

Then(/^I should not see image info$/) do
  expect(page).not_to have_css('.image')
end