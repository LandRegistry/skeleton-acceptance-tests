# frozen_string_literal: true

module Disclaimer
  # Checks the disclaimer message is shown
  def disclaimer?
    message = 'This is not a real service. It\'s intended for training purposes only.'
    expect(page).to have_content(message)
  end
end
