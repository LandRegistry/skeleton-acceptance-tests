# frozen_string_literal: true

# Page Checks
Then('the text {string} is displayed on the page') do |search_text|
  expect(page).to have_content(search_text)
end
