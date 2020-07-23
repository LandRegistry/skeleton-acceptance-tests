# frozen_string_literal: true

Given('I visit the confirmation page') do
  @confirmation_page = ConfirmationPage.new.visit.displayed?
end

Then('the confirmation page is displayed') do
  @confirmation_page.displayed?
end

Then('the application is completed successfully') do
  expect(page).to have_content(ConfirmationPage.new.displayed?.reference_number)
end
