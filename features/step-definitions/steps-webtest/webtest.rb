# frozen_string_literal: true

# Use Capybara "Visit" method to visit the webpage
# provided by the "path" variable
Given('I visit {string}') do |path|
  visit(path)
end

Given('I search Google for {string}') do |search_term|
  # Use RSPEC assertion to make sure we are on the correct page
  # Search is case insensitive, helps with mobile devices
  # expect(page).to have_content(/Images/i)

  # Use Capybara "fill_in" method to put text from "search_term" variable
  # into the Google search field. which has  id: 'q'
  fill_in('q', with: search_term).send_keys(:return)
end

Then('the text {string} is displayed on the page') do |search_text|
  # Use RSPEC assertion to make sure text from variable 'search_text'
  # is on the page
  expect(page).to have_content(search_text)
end
