# frozen_string_literal: true

require_relative('generic_page')

class ServicePage < GenericPage
  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/service"
    @header = 'Why are you using this service?'
    @text_field_id = 'service'
    @continue_button_text = 'Continue'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def click_continue_button
    click_button(@continue_button_text)
  end

  def fill_in_answer(answer)
    fill_in @text_field_id, with: answer
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
  def complete_service_page(answer)
    fill_in_answer(answer)
    click_continue_button
    AddressPage.new
  end
end
