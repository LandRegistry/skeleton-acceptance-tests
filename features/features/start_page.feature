@start_page
Feature: Test site start page

  Scenario: Navigate to the skeleton page from start page
    Given I visit the start page
    When I click the start now button
    Then the skeleton page is displayed

  Scenario: Start page has the disclaimer
    Given I visit the start page
    Then the disclaimer is displayed

  Scenario: Start page content is displayed
    Given I visit the start page
    Then the expected content for the start page is displayed
