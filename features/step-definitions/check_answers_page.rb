# frozen_string_literal: true

Given('I visit the check your answers page') do
  @check_answers_page = CheckAnswersPage.new.visit.displayed?
end

Then('the check your answers page is displayed') do
  @check_answers_page.displayed?
end

When('I accept and send the application') do
  @check_answers_page.click_accept_button
end

Then('all the information for an Inexperienced user is displayed') do
  inexperienced_user = InexperiencedUser.new

  # Basic page page content / data checks
  expect(page).to have_content(inexperienced_user.skeleton)
  expect(page).to have_content(inexperienced_user.service)
  expect(page).to have_content(inexperienced_user.address.line1)
  expect(page).to have_content(inexperienced_user.address.line2)
  expect(page).to have_content(inexperienced_user.address.town)
  expect(page).to have_content(inexperienced_user.address.county)
  expect(page).to have_content(inexperienced_user.address.postcode)
  expect(page).to have_content(inexperienced_user.checkbox)
  expect(page).to have_content(readable_filename(inexperienced_user.file))
end
