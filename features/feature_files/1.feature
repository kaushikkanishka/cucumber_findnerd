Feature:

 #Verify the Home page
  @TC001 @main @sanity @regression @high @homepage @positive
  Scenario: Verify the Home page

    Given I am at Home Page
    Then User should be able to see the following links
      | Findnerd Logo |
      | Nerd Digest   |
      | Tech QnA      |
      | Find Projects |
      | Sign In       |
      | Register      |

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
      | xxxxxxx  | xxxxxxx  |

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
      | LinkedIn_username | LinkedIn_password |
      | xxxxxxx@gmail.com | xxxxxxxxxx        |

 #Verify the browse users functionality
  @TC010 @main @sanity @positive @medium @regression
  Scenario: Browse Users

    Given I login to the site as "Normal User"
    When I clicked on "Browse Nerds" link
    And I searched "Kanishka Kaushik" as user
    Then User Id with Image should be displayed
    And Name of user with image should be displayed
    And This is the end of testcase


 #Fields in Post a Tech Job
  @TC011 @main @sanity @positive @medium @regression
  Scenario: Verify the fields in Post a Tech Job
    Given I login to the site as "Normal User"
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
  @TC012 @main @sanity @regression @positive @high
  Scenario: Verify Publish Confirmation Page On Preview Click on Node Creation Page
    Given I login to the site as "Normal User"
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

#Verify the Publish button Functionality
  @TC013 @main @sanity @regression @positive @high
  Scenario: Verify the Publish button Functionality in Publish Confirmation page Node (Post a Tech Job) already Created

    Given I login to the site as "Normal User"
    When I clicked on Draft link
    And I clicked the recently created project
    And I clicked "Publish" button
    Then I should be see the following message
      | You have successfully published your post. Waiting for admin approval. Click here to continue. |
    And Publish & Back buttons should disappear
    And Post/Node should be submitted to admin approval/rejection
    And Post should be displayed under "My Content>>Published Page"
    And This is the end of testcase

#Verify Manage Company Link with its content
  @TC016 @main @sanity @regression @positive @medium
  Scenario: Verify Company Profile Information and Address section
    Given I login to the site as "Company Admin"
    And I clicked on "Edit Company Profile" link
    Then I should land on "Company Profile" page
    And I should see the following Company Profile information
      | Company Logo              |
      | Edit Basic Profile Button |
      | Company Title             |
      | Company Website           |
      | Contact Email             |
      | Phone Number              |
      | Company Employees count   |
      | Company Projects count    |
      | Company Updates count     |
    And Company Address Section should have Add Address button & Address grid
    And I should see the following Company Chat information
      | Online Users Section |
      | Message Section      |
      | Chat Input Box       |
    And History link should be present
    And I should see the following fields under Employees section
      | Search Employee Button   |
      | Employee Profile Listing |
      | More Button              |
    And I should see the following fields under Profiles Section
      | Add Completed Project Button                 |
      | Company Profile Listing of completed project |
      | More Button                                  |
    And I should see the following fields under Other Information Section
      | Edit Other Profile Information button |
      | About us                              |
      | Company Summary                       |
    And I should see the following information under Financial Information Section
      | Amount in $ for Balance        |
      | Amount in $ for Pending Credit |
      | Amount in $ for Safe Balance   |
    And I should see Company Transaction History Section on clicking Company Dashboard link
    And I should see the following fields under Company Activity Updates section
      | Activity Input box |
      | Overlay Content    |
#      | Status Group Section |
    And I should see the following under Profile Files Section
      | Record /Upload Button |
      | Video Section         |
      | Images                |
      | Others Files          |
      | Video Files           |
    And This is the end of testcase

#Verify the Company Chat Section
  @TC018 @main @sanity @regression @positive @medium
  Scenario: Verify the Company Chat Section (For Public Profile Or View Profile of the Company Page)
    Given I login to the site as "Normal User"
    When I clicked on "Company" link from left navigation
    And I enter message "Dummy Chat message" in the Chat Area
    Then I should see the User Profile image and User ID in message section
    And I should see "Dummy Chat message" as the chat text
    And I should see "just now" for the instantly send message
    When I again send "New Dummy Chat message" as chat message
    Then I should see "(x) second(s) ago" for the previous chat message
      #And Chat text "Dummy Chat message" should be displayed to all Users involved in the online Chat
    And User should be navigated to User Profile page on clicking the user-id
    And This is the end of testcase

#Verify Chat functionality in Company Chat Overlay

  @TC019 @main @sanity @regression @positive @medium
  Scenario: Verify Chat functionality in Company Chat Overlay
    Given I login to the site as "Normal User"
    When I clicked on "Company Chat" link from left navigation
    Then I should see the following chat message fields
      | Online users                   |
      | Message screen                 |
      | Text field to send the message |
      | History                        |
    And This is the end of testcase

#Verify “Add/Remove Employee” Button in Employees Section
  @TC020 @main @sanity @regression @positive @low
  Scenario: Verify “Add/Remove Employee” Button in Employees Section

    Given I login to the site as "Company Admin"
    When I clicked on "Company" link from left navigation
    Then I should see "Search Employee" tooltip on mouse hover to “Add Employee” Button
    And I should see the form title "Search people to invite to company" on clicking the “Add Employee” Button
    And I should see the following fields in the form
      | Search Box    |
      | Search Button |
    And This is the end of testcase

#Verify the status of the searched users in 'Employess' section
  @TC021 @main @sanity @regression @positive @high
  Scenario: Verify the status of the searched users in 'Employess' section

    Given I login to the site as "Company Admin"
    When I clicked on "Company" link from left navigation
    And I clicked on “Add Employee” Button
    And I enter "Andy" in the Employee search textbox
    And I click “Search” Button on Search Form pop-up
    Then I should see "Invite To company" tooltip for uninvited users
    And I should see "Invitation Sent" tooltip for invitation send users
    And I should see "Invitation Rejected" tooltip for rejected invitations
    And I should see "Existing Employee" tooltip for existing users of company
    And This is the end of testcase

#Verify “Financial Information” Details on Company profile page
  @TC024 @main @sanity @regression @positive @high
  Scenario: Verify “Financial Information” Details

    Given I login to the site as "Company Admin"
    When I clicked on "Company" link from left navigation
    Then I should see the following information under Financial Information Section
      | Amount in $ for Balance        |
      | Amount in $ for Pending Credit |
      | Amount in $ for Safe Balance   |
    And This is the end of testcase

#Verify “Company Dashboard” Link on Company Profile page
  @TC025 @main @sanity @regression @positive @medium
  Scenario: Verify “Company Dashboard” Link

    Given I login to the site as "Company Admin"
    When I clicked on "Company" link from left navigation
    Then I clicked on Company Dashboard link
    And I should see Transactions page by default
    And I should see last 30 days transactions
    And This is the end of testcase


