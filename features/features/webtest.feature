@webtest
Feature: Search on Google

- This feature will perform two searches on Google to verify that,
  the suite is configured correctly.
- One test will pass
- One test will fail, producing a screenshot, and saving the page HMTLs

@google @pass
Scenario: Search for Gamma on Google
	Given I visit "https://www.google.co.uk/"
		And I search Google for "Gamma"
	Then the text "Gamma" is displayed on the page

@google @fail
Scenario: A deliberately failing test to produce a screenshot, and page HTML
	Given I visit "https://www.google.co.uk/"
		And I search Google for "Gamma"
	Then the text "random_garbage_to_look_for-12345678" is displayed on the page
