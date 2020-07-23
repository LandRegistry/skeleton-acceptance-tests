# frozen_string_literal: true

require_relative('generic_page')

class FileUploadPage < GenericPage
  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/file_upload"
    @header = 'Please upload a file'
    @file_upload_id = 'file-upload-1'
    @continue_button_text = 'Continue'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def click_continue_button
    click_button(@continue_button_text)
  end

  def upload_file(file)
    attach_file(@file_upload_id, file)
  end

  # ---- Common Page Object Model (POM) methods ----
  def visit
    Capybara.visit(@url)
    self
  end

  def displayed?
    expect(current_url).to eq @url
    self
  end

  # Completes page
  def complete_file_upload_page(file)
    upload_file(file)
    click_continue_button
    CheckAnswersPage.new
  end
end
