Feature:

 #Verify the Home page
  @TC001 @sanity @regression @high @homepage @positive
  Scenario: Verify the Home page

    Given I am at Home Page
    Then User should be able to see the following links
      |Findnerd Logo|
      |Nerd Digest|
      |Tech QnA|
      |Find Projects|
      |Sign In|
      |Register|

 #Verify the Signin Functionality through Global Header
  @TC006 @sanity @signin @medium @positive @regression
  Scenario Outline: Signin through Global Header
    Given I am at Home Page
    And I clicked on SignIn link
    And I enter <Username> as username for SignIn
    And I enter <Password> as password for SignIn
    And I clicked Remember me checkbox
    And I clicked on SignIn button
    Then I should see the Activities page
    And This is the end of testcase

    Examples:
      | Username | Password |
      | qapeter   | 123456 |

 #Log In through Social Media Button LinkedIn
  @TC008 @sanity @critical @signin @positive @regression
  Scenario Outline: Sign in with LinkedIn

    Given I am at Home Page
    And I clicked on SignIn link
    When I Clicked on “Sign in with LinkedIn” Button
    #Then I switched to linkedIn Popup
    And I enter <LinkedIn_username> as username in LinkedIn overlay
    And I enter <LinkedIn_password> as password in LinkedIn overlay
    And I clicked on "Allow Access" button
    Then I should be logged in to the site
    And I should see the Activities page
    And This is the end of testcase

    Examples:
      | LinkedIn_username     | LinkedIn_password |
      | evontech587@gmail.com | evontech_587      |

 #Verify the browse users functionality
  @TC010 @sanity @positive @medium @positive @regression
  Scenario: Browse Users

    Given I login to the site as valid user
    When I clicked on "Browse Nerds" link
    And I searched "Kanishka Kaushik" as user
    Then User Id with Image should be displayed
    And Name of user with image should be displayed
    And This is the end of testcase