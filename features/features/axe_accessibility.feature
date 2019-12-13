@axe
Feature: Run the Axe steps to check pages for accessibility issues

  - We have no step definition for the step
    "the page should be accessible according to: wcag2aa"
  - This is provided by the axe-matchers gem
  https://github.com/dequelabs/axe-matchers/blob/develop/docs/Cucumber.md#built-in-accessibility-cucumber-steps

  @pass
  Scenario: Accessible page passes checks
    Given I visit "https://www.gov.uk/"
    Then the page should be accessible according to: wcag2aa

  @fail
  Scenario: Non accessible page fails checks
    Given I visit "http://abcdcomputech.dequecloud.com"
    Then the page should be accessible according to: wcag2aa