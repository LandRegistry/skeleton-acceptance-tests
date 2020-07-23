# frozen_string_literal: true

# ---- Page Object Model (POM) loader Steps -----
Given('I visit the start page') do
  @start_page = StartPage.new.visit.displayed?
end

Then('the start page is displayed') do
  @start_page.displayed?
end

# ---- Test Steps ----
When('I click the start now button') do
  @start_page.click_start_now_button
end

Then('the disclaimer is displayed') do
  # Call the 'disclaimer?' method from the 'Disclaimer' module
  @start_page.disclaimer?
end

Then('the expected content for the start page is displayed') do
  # Call the 'disclaimer?' method from the 'Disclaimer' module
  @start_page.disclaimer?

  # Page content checks
  expect(page).to have_content(@start_page.title)
  @start_page.related_links.each { |link| expect(page).to have_link(link) }
  @start_page.use_this_service.each { |text| expect(page).to have_content(text) }
  @start_page.before_you_start.each { |text| expect(page).to have_content(text) }
end
