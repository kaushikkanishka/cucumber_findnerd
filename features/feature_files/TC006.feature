Feature: Verify the Signin Functionality through Global Header
  @sanity @signin @medium @positive
  Scenario Outline: Signin through Global Header
    Given I am at Home Page
    And I clicked on SignIn link
    And I enter <Username> as username for SignIn
    And I enter <Password> as password for SignIn
    And I clicked Remember me checkbox
    And I clicked on SignIn button
    And This is the end of testcase

    Examples:
      | Username | Password |
      | qapeter   | 123456 |