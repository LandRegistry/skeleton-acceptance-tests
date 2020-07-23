@submit_application @e2e
Feature: Submit application

  @happy_path @browser
  Scenario: Can submit an application with default data
    Given I complete the flow as a Inexperienced user
    When I accept and send the application
    Then the application is completed successfully

  @no_data
  Scenario: Can submit an application with no data provided
    Given I complete the flow without entering data
    When I accept and send the application
    Then the application is completed successfully

  @no_data
  Scenario: Can submit an application with no data provided - alternative
    - Direct visit to the page works for this simple application.
    - Would likely need to manipulate sessions in real application.

    Given I visit the check your answers page
    When I accept and send the application
    Then the application is completed successfully
