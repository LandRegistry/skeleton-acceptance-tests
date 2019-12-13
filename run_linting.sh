#!/bin/bash -l
bundle install
echo "- - - Running Linting check with Rubocop - - -"
rubocop
exit $?
