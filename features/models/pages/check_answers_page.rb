# frozen_string_literal: true

require_relative('generic_page')

class CheckAnswersPage < GenericPage
  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/check-your-answers"
    @header = 'Check your answers before sending your application'
    @accept_button_text = 'Accept and send'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def click_accept_button
    click_button(@accept_button_text)
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
  def complete_check_answers_page
    click_accept_button
    ConfirmationPage.new
  end
end
