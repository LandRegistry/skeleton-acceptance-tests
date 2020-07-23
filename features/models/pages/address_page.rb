# frozen_string_literal: true

require_relative('generic_page')

class AddressPage < GenericPage
  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/address"
    @header = 'What is your address?'
    @address_line1_id = 'address-line-1'
    @address_line2_id = 'address-line-2'
    @address_town_id = 'address-town'
    @address_county_id = 'address-county'
    @address_postcode_id = 'address-postcode'
    @continue_button_text = 'Continue'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def click_continue_button
    click_button(@continue_button_text)
  end

  def fill_in_address(address)
    fill_in @address_line1_id, with: address.line1
    fill_in @address_line2_id, with: address.line2
    fill_in @address_town_id, with: address.town
    fill_in @address_county_id, with: address.county
    fill_in @address_postcode_id, with: address.postcode
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
  def complete_address_page(address)
    fill_in_address(address)
    click_continue_button
    CheckboxPage.new
  end
end
