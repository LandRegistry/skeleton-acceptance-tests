# frozen_string_literal: true

When('I complete the flow as a Inexperienced user') do
  @current_user = InexperiencedUser.new

  start_page = StartPage.new.visit.displayed?
  @check_answers_page = start_page.complete_start_page
                                  .complete_skeleton_page(@current_user.skeleton)
                                  .complete_service_page(@current_user.service)
                                  .complete_address_page(@current_user.address)
                                  .complete_checkbox_page(@current_user.checkbox)
                                  .complete_file_upload_page(@current_user.file)
end

Given('I complete the flow without entering data') do
  @current_user = nil
  # Navigates through each page without entering data
  # Similar but different approach to above step, for consideration.
  StartPage.new.visit.displayed?.complete_start_page
  SkeletonPage.new.displayed?.click_continue_button
  ServicePage.new.displayed?.click_continue_button
  AddressPage.new.displayed?.click_continue_button
  CheckboxPage.new.displayed?.click_continue_button
  FileUploadPage.new.displayed?.click_continue_button

  @check_answers_page = CheckAnswersPage.new.displayed?
end
