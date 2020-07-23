# frozen_string_literal: true

Given('I visit the service page') do
  @service_page = ServicePage.new.visit.displayed?
end

Given('the service page is displayed') do
  @service_page.displayed?
end
