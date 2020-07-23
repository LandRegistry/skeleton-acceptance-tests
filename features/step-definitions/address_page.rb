# frozen_string_literal: true

Given('I visit the address page') do
  @address_page = AddressPage.new.visit.displayed?
end

Then('the address page is displayed') do
  @address_page.displayed?
end
