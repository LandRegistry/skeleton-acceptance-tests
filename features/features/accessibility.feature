@axe
Feature: Accessibility checks
  - Scenarios to check pages are pass Axe matcher checks.
  - These do not prove a page is accessible.
  - Further manual checks are needed.
  - See: https://github.com/dequelabs/axe-core/blob/master/doc/rule-descriptions.md

  Scenario: Start page
    Given I visit the start page
    Then the page should be accessible according to: wcag2aa and wcag21aa

  Scenario: Skeleton page
    Given I visit the skeleton page
    Then the page should be accessible according to: wcag2aa and wcag21aa

  Scenario: Service page
    Given I visit the service page
    Then the page should be accessible according to: wcag2aa and wcag21aa

  Scenario: Address page
    Given I visit the address page
    Then the page should be accessible according to: wcag2aa and wcag21aa

  Scenario: Checkbox page
    Given I visit the checkbox page
    Then the page should be accessible according to: wcag2aa and wcag21aa

  Scenario: File Upload page
    Given I visit the file upload page
    Then the page should be accessible according to: wcag2aa and wcag21aa

  Scenario: Check your answers page
    Given I visit the check your answers page
    Then the page should be accessible according to: wcag2aa and wcag21aa

  Scenario: Confirmation page
    Given I visit the confirmation page
    Then the page should be accessible according to: wcag2aa and wcag21aa