# frozen_string_literal: true

# Taken from BrowserStack documentation.
# Modified to fit with Skeleton

require 'yaml'
require 'browserstack/local'

# monkey patch to avoid reset sessions
class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    @browser.navigate.to('about:blank') if @browser
  end
end

TASK_ID = (ENV['TASK_ID'] || 0).to_i

CONFIG = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), "../../browser_configs/#{BS_CONFIG}.config.yml")))
CONFIG['user'] = BS_USERNAME
CONFIG['key'] = BS_ACCESS_KEY
CONFIG['common_caps'] = {}
CONFIG['common_caps']['project'] = BS_PROJECT
CONFIG['common_caps']['build'] = BS_PROJECT
CONFIG['common_caps']['acceptInsecureCerts'] = true
CONFIG['common_caps']['geoLocation'] = 'GB'

# BrowserStack Driver
Capybara.register_driver :browserstack do |app|
  @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])

  # Code to start browserstack local before start of test
  if @caps['browserstack.local'] && @caps['browserstack.local'].to_s == 'true'
    @bs_local = BrowserStack::Local.new
    bs_local_args = { 'key' => (CONFIG['key']).to_s }
    @bs_local.start(bs_local_args)
  end

  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 url: "https://#{BS_USERNAME}:#{BS_ACCESS_KEY}@#{BS_SERVER}/wd/hub",
                                 desired_capabilities: @caps)
end

# Code to stop browserstack local after end of test
at_exit do
  @bs_local.stop unless @bs_local.nil?
end
