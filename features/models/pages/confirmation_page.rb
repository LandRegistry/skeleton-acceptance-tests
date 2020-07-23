# frozen_string_literal: true

require_relative('generic_page')

class ConfirmationPage < GenericPage
  attr_reader :reference_number

  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/confirmation"
    @header = 'Application complete'
    @reference_number = 'AUTO119'
    @start_again_link_text = ' Submit another application'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def start_again
    click_link(@start_again_link_text)
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
end
