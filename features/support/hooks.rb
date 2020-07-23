# frozen_string_literal: true

# Hooks can be added to run before or after scenarios
# see the guide https://github.com/cucumber/cucumber/wiki/Hooks
# After any failed scenario output the portal application info.
After do |scenario|
  if scenario.failed?
    puts ''
    puts '-----------------Test Data------------------'
    puts @current_user
    puts '--------------------------------------------'
  end
end
