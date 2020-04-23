#!/bin/bash

# installs the gems listed in Gemfile
# Useful if run outside of a Docker environment
# bundle install

# Calls the linting script
sh run_linting.sh

# command to execute the tests
# The $@ allows parameters like the tags to be passed in using the dev-env shortcut
cucumber --format json --out report.json --format pretty $@
