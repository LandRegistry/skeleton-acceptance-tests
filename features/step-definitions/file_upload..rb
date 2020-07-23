# frozen_string_literal: true

Given('I visit the file upload page') do
  @file_upload_page = FileUploadPage.new.visit.displayed?
end

Then('the file upload page is displayed') do
  @file_upload_page.displayed?
end
