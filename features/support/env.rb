# frozen_string_literal: true

# ENV RULES
# 1. No URL domain or username/ password should be anywhere but this env.rb file.
# The environment variable should be set in either:
# a. Jenkins export command
# b. Dockerfile that sets the container parameters
# c. export commands within the run_tests.sh file.
# Additional shell scripts could be added for other test environments where you wish to run the tests from your PC
# 2. Global variables with $ should not be declared anywhere else but here

# Frontend(s)/UI's
AUTOMATION_TRAINING_UI = ENV['AUTOMATION_TRAINING_UI']

# Default webdriver to use. String converted to Symbol
DRIVER = ENV['DRIVER'].to_sym

# BrowserStack env vars
BS_USERNAME = ENV['BS_USERNAME']
BS_ACCESS_KEY = ENV['BS_ACCESS_KEY']
BS_PROJECT = ENV['BS_PROJECT']
BS_BUILD = ENV['BS_BUILD']
BS_SERVER = ENV['BS_SERVER']
BS_CONFIG = ENV['BS_CONFIG']
