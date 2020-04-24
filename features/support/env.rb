# frozen_string_literal: true

# ENV RULES
# 1. No URL domain or username/ password should be anywhere but this env.rb file
# The environment variable should be set in either:
# a. Jenkins export command
# b. Dockerfile that sets the container parameters
# c. export commands within the run_tests.sh file.
# Additional shell scripts could be added for other test environments
# where you wish to run the tests from your PC
# 2. Global variables with $ should not be declared anywhere else but here

# Frontend(s)/UI's
# $SERVICE_UI_DOMAIN = ENV['SERVICE_UI_DOMAIN']

# API(s)
# $SERVICE_API_DOMAIN = ENV['SERVICE_API_DOMAIN']
# $SERVICE_API_VERSION = ENV['SERVICE_API_VERSION']

# Test Fixture(s)
# $JENKINS_WORK SPACE = ENV['JENKINS_WORKSPACE']

BS_USERNAME = ENV['BS_USERNAME']
BS_ACCESS_KEY = ENV['BS_ACCESS_KEY']
BS_BUILD = ENV['BS_BUILD']
BS_PROJECT = ENV['BS_PROJECT']
BS_SERVER = ENV['BS_SERVER']
