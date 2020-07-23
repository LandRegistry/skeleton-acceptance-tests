# frozen_string_literal: true

Given('I visit the checkbox page') do
  @checkbox_page = CheckboxPage.new.visit.displayed?
end

Then('the checkbox page is displayed') do
  @checkbox_page.displayed?
end
