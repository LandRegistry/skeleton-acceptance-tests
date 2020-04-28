# frozen_string_literal: true

# CONFIG RULES:
# 1. Use library functions to keep re-usable code in clear sections
# 2. Gems must be managed in the Gemfile
#   - Only include the gems you need
#   - Include the required versions of the gems

require 'axe/cucumber/step_definitions'
require 'capybara/cucumber'
require 'test/unit/assertions'
require 'capybara-screenshot/cucumber'
require 'net/http/post/multipart'
require 'selenium/webdriver'

World(Test::Unit::Assertions)
World(Capybara::DSL)

# Defaults
Capybara.default_selector = :id
Capybara.default_max_wait_time = 10
Capybara.app_host = 'http://localhost:4567'
Capybara.default_driver = DRIVER
Capybara.javascript_driver = DRIVER

# Screenshot settings
Capybara.save_path = './screenshots/'
Capybara::Screenshot.prune_strategy = :keep_last_run

# Screenshot driver
Capybara::Screenshot.register_driver(DRIVER) do |driver, path|
  driver.browser.save_screenshot(path)
end

# Headless Chrome
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('no-sandbox')
  options.add_argument('headless')
  options.add_argument('disable-gpu')
  options.add_argument('window-size=1920,1080')
  options.add_argument('disable-dev-shm-usage')

  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 options: options)
end
