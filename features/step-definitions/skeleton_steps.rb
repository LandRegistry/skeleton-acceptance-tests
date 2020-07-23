# frozen_string_literal: true

# Visit the page, directly by the URL
Given('I visit the skeleton page') do
  @skeleton_page = SkeletonPage.new.visit.displayed?
end

Then('the skeleton page is displayed') do
  SkeletonPage.new.displayed?
end
