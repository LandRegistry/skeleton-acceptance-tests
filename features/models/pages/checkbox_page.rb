# frozen_string_literal: true

require_relative('generic_page')

class CheckboxPage < GenericPage
  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/checkbox"
    @header = 'Which things do you like?'
    @choice_ruby_id = 'ruby'
    @choice_cucumber_id = 'cucumber'
    @choice_capybara_id = 'capybara'
    @choice_skeleton_id = 'skeleton'
    @choice_automation_id = 'automation'
    @continue_button_text = 'Continue'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def click_continue_button
    click_button(@continue_button_text)
  end

  def check_likes(likes)
    check likes, visible: false
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
  def complete_checkbox_page(likes)
    check_likes(likes)
    click_continue_button
    FileUploadPage.new
  end
end
