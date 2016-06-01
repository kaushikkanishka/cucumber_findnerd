Feature:

 #Verify the Home page
  @TC001 @main @sanity @regression @high @homepage @positive
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
  @TC006 @main @sanity @signin @medium @positive @regression
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
  @TC008 @main @sanity @critical @signin @positive @regression
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
  @TC010 @main @sanity @positive @medium @regression
  Scenario: Browse Users

    Given I login to the site as valid user
    When I clicked on "Browse Nerds" link
    And I searched "Kanishka Kaushik" as user
    Then User Id with Image should be displayed
    And Name of user with image should be displayed
    And This is the end of testcase


 #Fields in Post a Tech Job
  @TC011 @main @sanity @positive @medium @regression
  Scenario: Verify the fields in Post a Tech Job
    Given I login to the site as valid user
    When I clicked on "Post Project" link
    Then I should see the following on Post Project page
      | Hire a freelancer or Tech team!                                          |
      | Get instant applications from our database of companies and freelancers. |
      | Post your requirements.                                                  |
      | Select teams based on our revolutionary ranking algorithm.               |
      | Manage project sprint, task, bugs through our PM tool.                   |
      | Manage Team members & Improve productivity using our session tracker.    |
      | Pay them through safe pay.                                               |
      | All of the above @ 0 cost for the first 100 projects.                    |
      | Title                                                                    |
      | Testing Help icon                                                        |
      | Attach Files, Zip etc                                                    |
      | Record From Desktop                                                      |
      | Record From Webcam                                                       |
      | Preview Area                                                             |
      | Tags                                                                     |
      | You can create new content after 2 minutes gap of last created content.  |
      | Preview Button                                                           |
    And "Select Category" option should be selected by default in "Category" dropdown
    And I should see the following dropdown on selecting "Fixed Price" radio button
      | Budget   |
      | Duration |
    And I should see the following dropdown on selecting "Hourly Price" radio button
      | Hourly Rate |
      | Workload    |
      | Duration    |
    And I should see the following under "Company status Information" section
      | Our team with No. of developers   |
      | Who we work with No. of companies |
      | Our work No. of projects          |
    And This is the end of testcase

 #Verify blog publish functionality
  @TC012 @main @sanity @regression @positive
  Scenario: Verify Publish Confirmation Page On Preview Click on Node Creation Page
    Given I login to the site as valid user
    When I clicked on "Post Project" link
    And I select "Automation" from "Category" dropdown
    And I select "Not Sure" option from Budget dropdown
    And I select "3-4 weeks" option from Duration dropdown
    And I enter the blog title as "Test Title"
    ##...............And I attached a "testImage" file
    And I enter "This is a dummy text for testing" as dummy text
    And I enter "test" as dummy tags
    And I clicked the "Preview" button
    Then I should redirect to Publish Confirmation Page
    And Publish Confirmation Page should have "Home<< FindProjects<< Automation" breadcrumb
    And Publish Confirmation Page should have the following fields
      | Publish Button     |
      | Back button        |
      | Publish Tenure day |
      | Hiring Open        |
#      | User Id Link       |
      | Comments Section   |
    And Publish Confirmation Page should have blog title as "Test Title"
    And Publish Confirmation Page should have Duration as "3-4 weeks"
    And Publish Confirmation Page should have Budget as "Not Sure"
    And Publish Confirmation Page should have text as "This is a dummy text for testing"
    And Publish Confirmation Page should have tags as "Test"
    And This is the end of testcase