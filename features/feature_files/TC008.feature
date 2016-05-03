Feature: Log In through Social Media Button LinkedIn
  @sanity @critical @signin @positive
    Scenario Outline: Sign in with LinkedIn

    Given I am at Home Page
    And I clicked on SignIn link
    When I Clicked on “Sign in with LinkedIn” Button
    #Then I switched to linkedIn Popup
    And I enter <LinkedIn_username> as username in LinkedIn overlay
    And I enter <LinkedIn_password> as password in LinkedIn overlay
    And I clicked on "Allow Access" button
    Then I should be logged in to the site
    #And I should see the Activities page
    And This is the end of testcase

    Examples:
      | LinkedIn_username     | LinkedIn_password |
      | evontech587@gmail.com | evontech_587      |

