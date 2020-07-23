# frozen_string_literal: true

# This is the Parent class that all Page Objects should inherit from.
# E.g. ExampleFormPage < GenericPage

class GenericPage
  include Capybara::DSL
  include RSpec::Matchers
end
