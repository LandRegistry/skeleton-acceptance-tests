#!/bin/bash

# installs the gems listed in Gemfile
# Useful if run outside of a Docker environment
# bundle install

# Calls the linting script
sh run_linting.sh

# command to execute the tests
# "$@" (quoted) allows parameters like the tags to be passed in using the dev-env shortcut
# without word-splitting on spaces — unquoted $@ breaks multi-word --tags expressions
# like '@foo or @bar' back into separate arguments before cucumber sees them.
cucumber --format json --out report.json --format pretty "$@"
