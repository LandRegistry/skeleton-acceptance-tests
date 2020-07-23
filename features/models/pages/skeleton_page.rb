# frozen_string_literal: true

require_relative('generic_page')

class SkeletonPage < GenericPage
  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/skeleton"
    @header = 'Have you looked at the acceptance tests skeleton?'
    @continue_button_text = 'Continue'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def click_continue_button
    click_button(@continue_button_text)
  end

  def choose_option(option)
    choose(option, visible: false)
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
  def complete_skeleton_page(option)
    choose_option(option)
    click_continue_button
    ServicePage.new
  end
end
