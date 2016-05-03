Feature: Test
  Scenario Outline: Verify the “Sign in” Functionality through Global Header
    Given I am at Home Page
    And I clicked on SignIn link
    And I enter <username1> as username and <password1> as password for SignIn
#    And I clicked Remember me checkbox
#    And I clicked on SignIn button
#    And This is the end of testcase
#
    Examples:
      | username1 | password1 |
      | "qapeter" | "qapeter" |