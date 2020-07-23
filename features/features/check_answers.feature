@check_answers
Feature: Check your answers

  Scenario: Check your answers page shows entered data
    Given I complete the flow as a Inexperienced user
    Then the check your answers page is displayed
    And all the information for an Inexperienced user is displayed
