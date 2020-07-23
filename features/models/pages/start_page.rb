# frozen_string_literal: true

require_relative('generic_page')
require_relative('components/disclaimer')

class StartPage < GenericPage
  include Disclaimer

  attr_reader :url
  attr_reader :title
  attr_reader :start_now_button_text
  attr_reader :common_dev_env_link
  attr_reader :acceptance_skeleton_link
  attr_reader :cucumber_docs_link
  attr_reader :ruby_doc_link
  attr_reader :clear_session_link
  attr_reader :prototype_kit_link
  attr_reader :use_service_header_text
  attr_reader :use_service_list1
  attr_reader :use_service_list2
  attr_reader :use_service_list3
  attr_reader :before_you_start_header_text
  attr_reader :before_you_start_text

  def initialize
    @url = "#{AUTOMATION_TRAINING_UI}/index"
    @title = 'Automate an application'
    @start_now_button_text = 'Start now'
    @common_dev_env_link = 'Common dev-env'
    @acceptance_skeleton_link = 'Acceptance tests skeleton'
    @cucumber_docs_link = 'Cucumber docs'
    @ruby_doc_link = 'Ruby docs'
    @clear_session_link = 'Clear session data'
    @prototype_kit_link = 'GOV.UK Prototype Kit'
    @use_service_header_text = 'Use this service to:'
    @use_service_list1 = 'Write automated tests against'
    @use_service_list2 = 'See how the HMLR UI standards are applied'
    @use_service_list3 = 'Explore a training service'
    @before_you_start_header_text = 'Before you start writing automation'
    @before_you_start_text = 'Ensure you have are familiar with the HMLR common dev-env,'\
    ' and the acceptance tests skeleton.'
  end

  # ---- Custom Page Object Model (POM) methods ----
  def click_start_now_button
    click_link(@start_now_button_text)
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

  def complete_start_page
    click_start_now_button
    SkeletonPage.new
  end

  def related_links
    [
      @common_dev_env_link,
      @acceptance_skeleton_link,
      @cucumber_docs_link,
      @ruby_doc_link,
      @clear_session_link,
      @prototype_kit_link
    ]
  end

  def use_this_service
    [
      @use_service_header_text,
      @use_service_list1,
      @use_service_list2,
      @use_service_list3
    ]
  end

  def before_you_start
    [
      @before_you_start_header_text,
      @before_you_start_text
    ]
  end
end
