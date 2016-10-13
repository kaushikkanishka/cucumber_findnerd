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
      | Username        | Password |
      | qatest.kkaushik | 123456   |

 #Feature: Verify the email
  @TC007a @main @sanity @critical @signin @positive @regression
  Scenario: Verify Forgot Password email subject

    Given I am at Home Page
    When I clicked on SignIn link
    And Click on “Forgot Password” link
    And I enter email id in Forgot Password overlay
    And I clicked on "Reset my Password" button
    Then Following message is displayed on clicking "Reset Password" button
      | Instructions to reset your password have been emailed to you |
    And Email with "Password Reset Instructions" subject should be received.

  @TC007b @main @sanity @critical @signin @positive @regression
  Scenario: Verify Forgot Password functionality

    Given I am at Home Page
    When I clicked on SignIn link
    And Click on “Forgot Password” link
    And I enter email id in Forgot Password overlay
    And I clicked on "Reset my Password" button
    And Following message is displayed on clicking "Reset Password" button
      | Instructions to reset your password have been emailed to you |
    And I clicked "Reset Password" link on email
    And I enter the new password
    Then Passsword should be changed and I loggedin as "GmailUser"

 #Log In through Social Media Button LinkedIn
  @TC008 @main @sanity @critical @signin @positive @regression
  Scenario Outline: Sign in with LinkedIn

    Given I am at Home Page
    And I clicked on SignIn link
    When I Clicked on “Sign in with LinkedIn” Button
    And I enter <LinkedIn_username> as username in LinkedIn overlay
    And I enter <LinkedIn_password> as password in LinkedIn overlay
    And I clicked on "Allow Access" button
    Then I should be logged in to the site
    And I should see the Activities page
    And This is the end of testcase

    Examples:
      | LinkedIn_username    | LinkedIn_password |
      | qabrij0303@gmail.com | manola0303        |

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
    Then I should see the following on the page
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
    And Publish Confirmation Page should have "Home << FindProjects << Automation" breadcrumb
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

#Verify “Activity Updates” on Company Profile and Workroom page

  @TC026 @main @sanity @regression @positive @critical
  Scenario: Verify “Activity Updates”

    Given I login to the site as "Company Admin"
    When I clicked on "Company" link from left navigation
    And I entered "Dummy update for testing" in company activity section
    And I uploaded a test image
    And I entered "www.testtest.com" in link textbox
    And I clicked Activity Update send button
    Then I should see "Dummy update for testing" in Activity Update Section
    And The Posted activity should contain following items
      | Company logo          |
      | User Id Link          |
      | Message               |
      | Show and Hide Details |
      | Reply Button          |
      | Delete Button         |
      | Favorite Button       |
      | Tenure                |
      | Hide Status Updates   |
    And I should also see update on Workroom page under Company Updates
    And This is the end of testcase

#Verify Company Report in Tabular View

  @TC027 @main @sanity @regression @positive @high
  Scenario: Verify Company Report in Tabular View

    Given I login to the site as "Company Admin"
    When I clicked on "Manage Reports" link from left navigation
    And I select "2016" as Year and "Jun" as Month from calender
    And I select "QA_TestProject_HOURLY_VIDEO" as project and employee from Employee Listing
    Then Tabular View report should be opened by default
    And The first row should have the following
      | selected Month with Dark Grey Background |
      | Date of selected month                   |
      | Total in last                            |
    And I should see the list of All/selected Project Members Name as title in Project Report
    And I should see the Weekly Hours Block below the Project Member names
    And I should see the following in the middle section of calender
      | Date block background colour as Green for working day |
      | Date block background colour as Grey for weekends     |
      | Sa and Su abbreviations for weekends                  |
      | Total effort for each block in front of Weekly Hours  |
      | Week default value should be 0.0                      |
      | Effort Hours in every Date block with zero as default |
    And I should see total worked hours in Right Section of Calender with default as zero
    And This is the end of testcase

#Verify the Publish Confirmation Page for Node already Created

  @TC030 @main @sanity @regression @positive @high
  Scenario: Verify the Publish Confirmation Page for Node

    Given I login to the site as "Normal User"
    When I clicked on "Record & Share" link
    And I selected "Automation" from "Category" dropdown
    And I enter the blog title as "Test Title"
    And I enter "This is a dummy text for testing" as dummy text
    And I enter "test" as dummy tags
    And I clicked the "Preview" button
    Then I should redirect to Publish Confirmation Page
    And Publish Confirmation Page should have the following fields
      | Share via link text         |
      | Share via link link         |
      | Share it to the public text |
      | Publish button              |
      | Back button                 |
      | Publish Tenure day          |
      | Voting bar                  |
      | Comments Section            |
    And Publish Confirmation Page should have "Home << NerdDigest << Automation" breadcrumb
    And Publish Confirmation Page should have blog title as "Test Title"
    And Publish Confirmation Page should have text as "This is a dummy text for testing"
    And Publish Confirmation Page should have tags as "Test"
    And I should see the User Profile image and User ID
    And This is the end of testcase

#Verify the “Creation & Publishing” of "Record Desktop & Share" node.

  @TC031 @main @sanity @regression @positive @high
  Scenario: Verify the “Creation & Publishing” of "Record Desktop & Share" node.

    Given I login to the site as "Normal User"
    When I clicked on "Record & Share" link
    And I selected "Automation" from "Category" dropdown
    And I enter the blog title as "Test Title"
    And I enter "This is a dummy text for testing" as dummy text
    And I enter "test" as dummy tags
    And I clicked the "Preview" button
    And I clicked "Publish" button on publish confirmation page
    Then I should see "You have successfully published your post. Click here to continue." message
    And I should not see the following
      | Publish button |
      | Back button    |
      | Share via link |
    And This is the end of testcase

#Verify “Share Via link” Functionality of "Record Desktop & Share" node.
  @TC032 @main @sanity @regression @positive @high
  Scenario: Verify “Share Via link” Functionality of "Record Desktop & Share" node.

    Given I login to the site as "Normal User"
    When I clicked on "Record & Share" link
    And I selected "Automation" from "Category" dropdown
    And I enter the blog title as "Test Title"
    And I enter "This is a dummy text for testing" as dummy text
    And I enter "test" as dummy tags
    And I clicked the "Preview" button
    And I clicked the node link
    Then I should see the node display page
    And I should see the functions similar to “Nerd Digest” page
    And This is the end of testcase

#Verify the fields in Set up a new Project
  @TC034 @main @sanity @regression @positive @low
  Scenario: Verify the fields in Set up a new Project

    Given I login to the site as "Normal User"
    When I clicked on "My Active Projects" link
    And I clicked on "Setup new Project" button
    Then I should see the Text Box with "Enter Project Title...." as placeholder
    And I should see Save and Close on entering the title
    And This is the end of testcase

#Verify the "Set up a new Project" in “Manage Projects ” Page
  @TC035 @main @sanity @regression @positive @low
  Scenario: Verify the "Set up a new Project" in “Manage Projects ” Page

    Given I login to the site as "Normal User"
    When I clicked on "My Active Projects" link
    And I clicked on "Setup new Project" button
    And I entered the Project title
    And I clicked the Save button
    Then I should see the Project Dashboard
    And This is the end of testcase

#Verify My Active Projects fields

  @TC033 @main @sanity @regression @positive @medium
  Scenario: Verify My Active Projects fields for Logged In users

    Given I login to the site as "Normal User"
    When I clicked on "My Active Projects" link
    Then I should see My Active Project Page
    And I should see the "Home >> Project >> Active" breadcrumb
    And I should see the Search Box with Search Button
    And I should see Setup a new project in "Tile Grid"
    And I should see the following fields in the Project detail
      | Project Title       |
      | Meta data           |
      | Project Description |
      | Project Creator ID  |
      | View Count          |
    And Pagination for project count greater than six
    And This is the end of testcase

#Verify the fields in Post Blog

  @TC036 @main @sanity @regression @positive @low
  Scenario: Verify the fields in Post Blog

    Given I login to the site as "Normal User"
    When I clicked on "Post Blog" link
    Then I should see the following on the page
      | Post Tech Blogs, Tutorials, Reviews or News.                                                    |
      | Earn reputation and improve your web wide tech rank.                                            |
      | Type in your tech analysis, product insights and tech solutions.                                |
      | Record your Desktop for better insights.                                                        |
      | Improve your nerd rank with views and positive vote.                                            |
      | More likes get you on our more featured section.                                                |
      | Nerd points help you engage with perspective employers and earn respect in developer community. |
      | Title                                                                                           |
      | Testing Help icon                                                                               |
      | Attach Files, Zip etc                                                                           |
      | Record From Desktop                                                                             |
      | Record From Webcam                                                                              |
      | Preview Area                                                                                    |
      | Tags                                                                                            |
      | You can create new content after 2 minutes gap of last created content.                         |
      | Preview Button                                                                                  |
    And "Select Category" option should be selected by default in "Category" dropdown
    And I should see the following under "Company status Information" section
      | Our team with No. of developers   |
      | Who we work with No. of companies |
      | Our work No. of projects          |
    And This is the end of testcase

#Verify the Publish confirmation Page after node creation

  @TC037 @main @sanity @regression @positive @high
  Scenario: Verify the Publish confirmation Page

    Given I login to the site as "Normal User"
    When I clicked on "Post Blog" link
    And I select "Automation" from "Category" dropdown
    And I enter the blog title as "Test Title"
    And I enter "This is a dummy text for testing" as dummy text
    And I enter "test" as dummy tags
    And I clicked the "Preview" button
    Then I should redirect to Publish Confirmation Page
    And Publish Confirmation Page should have "Home << NerdDigest << Automation" breadcrumb
    And Publish Confirmation Page should have the following fields
      | Publish Button     |
      | Back button        |
      | Publish Tenure day |
      | Voting bar         |
      | Comments Section   |
    And Publish Confirmation Page should have blog title as "Test Title"
    And Publish Confirmation Page should have text as "This is a dummy text for testing"
    And Publish Confirmation Page should have tags as "Test"
    And I should see the User Profile image and User ID
    And This is the end of testcase

#Verify the Publish button Functionality in Publish Confirmation page for Node (Posts Blog) already Created

  @TC038 @main @sanity @regression @positive @high
  Scenario: Verify the Publish button Functionality in Publish Confirmation page Node

    Given I login to the site as "Normal User"
    When I clicked on Draft link
    And I clicked the recently created project
    And I clicked "Publish" button
    Then I should be see the following message
      | You have successfully published your post. Click here to continue. |
    And Publish & Back buttons should disappear
    And Post/Node should be submitted to admin approval/rejection
    And Post should be displayed under "My Content>>Published Page"
    And This is the end of testcase

#Verify the fields in Ask Tech Query

  @TC040 @main @sanity @regression @positive @low
  Scenario: Verify the fields in Ask Tech Query for Loggedin users

    Given I login to the site as "Normal User"
    When I clicked on "Ask Tech Query" link
    And I select "Automation" from "Category" dropdown
    And I enter the blog title as "Test Query Title"
    And I enter "This is a dummy text for testing" as dummy text
    Then I should see the following on the page
      | Stuck In a Tech Issue?                                                  |
      | Our community of developers answer them for you.                        |
      | Type your query & post the code.                                        |
      | Record Your Desktop to explain better.                                  |
      | Upload files.                                                           |
      | Or Simply search through our own search engine.                         |
      | Title                                                                   |
      | Testing Help icon                                                       |
      | Attach Files, Zip etc                                                   |
      | Record From Desktop                                                     |
      | Record From Webcam                                                      |
      | Preview Area                                                            |
      | Tags                                                                    |
      | You can create new content after 2 minutes gap of last created content. |
      | Preview Button                                                          |
      | Featured Questions                                                      |
      | Ask Nerds                                                               |
    And "Select Category" option should be selected by default in "Category" dropdown
    And I should see the following under "Company status Information" section
      | Our team with No. of developers   |
      | Who we work with No. of companies |
      | Our work No. of projects          |
    And This is the end of testcase


#Verify the Publish Confirmation Page for Ask Tech Query for Node Creation
  @TC041 @main @sanity @regression @positive @high
  Scenario: Verify the Publish Confirmation Page for Ask Tech Query for Node Creation

    Given I login to the site as "Normal User"
    When I clicked on "Ask Tech Query" link
    And I select "Automation" from "Category" dropdown
    And I enter the blog title as "Test Title"
    And I enter "This is a dummy text for testing" as dummy text
    And I enter "test" as dummy tags
    And I clicked the "Preview" button
    Then I should redirect to Publish Confirmation Page
    And Publish Confirmation Page should have "Home << TechQnA << Automation" breadcrumb
    And Publish Confirmation Page should have the following fields
      | Publish Button     |
      | Back button        |
      | Publish Tenure day |
      | Voting bar         |
      | Comments Section   |
    And Publish Confirmation Page should have blog title as "Test Title"
    And Publish Confirmation Page should have text as "This is a dummy text for testing"
    And Publish Confirmation Page should have tags as "Test"
    And I should see the User Profile image and User ID
    And This is the end of testcase

#Verify the Publish button Functionality in Publish Confirmation page for already Created Tech Query

  @TC042 @main @sanity @regression @positive @high
  Scenario: Verify the Publish button Functionality in Publish Confirmation page Node

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

#Verify Tuteset

  @TC046a @main @sanity @regression @positive @high
  Scenario: Verify message for blank tuteset

    Given I login to the site as "Normal User"
    When I clicked on "Tute Sets" link
    Then I should see the "Home >> Tute Sets" breadcrumb
    And I should see the message "No Tuteset found !!" if no Tute is published
    And This is the end of testcase

  @TC046b @main @sanity @regression @positive @high
  Scenario: Verify tuteset block items

    Given I login to the site as "Other Normal User"
    When I clicked on "Tute Sets" link
    Then I should see the tuteset
    And I should see the following items in the tuteset
      | Tute Set Name as title         |
      | Count of blogs in the tute set |
      | Share icon                     |
      | View icon                      |
    And This is the end of testcase

#Verify the blogs listing of Tute Set

  @TC047 @main @sanity @regression @positive @high
  Scenario: Verify the blogs listing of Tute Set

    Given I login to the site as "Other Normal User"
    When I clicked on "Tute Sets" link
    And I clicked the tuteset
    Then I should see the overlay with the following items
      | Tute Set name                 |
      | Blog titles added in Tute Set |
      | Up arrow link                 |
      | Down arrow Link               |
      | Delete icon links             |
      | Close(X) icon                 |
    And This is the end of testcase

#Verify the details & functionality of added blogs in Tute Set Overlay

  @TC048a @main @sanity @regression @positive @high
  Scenario: Verify Blog diplay page on clicking the blog title

    Given I login to the site as "Other Normal User"
    When I clicked on "Tute Sets" link
    And I clicked the tuteset
    And I clicked the first blog title
    Then I should see the blog detail page
    And This is the end of testcase

  @TC048b @main @sanity @regression @positive @high
  Scenario: Verify Up arrow link functionality on tuteset overlay

    Given I login to the site as "Other Normal User"
    When I clicked on "Tute Sets" link
    And I clicked the tuteset
    And I clicked the Up arrow of a blog
    Then The blog should be moved one position upwards
    And This is the end of testcase

  @TC048c @main @sanity @regression @positive @high
  Scenario: Verify down arrow link functionality on tuteset overlay

    Given I login to the site as "Other Normal User"
    When I clicked on "Tute Sets" link
    And I clicked the tuteset
    And I clicked the Down arrow of a blog
    Then The blog should be moved one position downwards
    And This is the end of testcase

  @TC048d @main @sanity @regression @positive @high
  Scenario: Verify the delete blog functionality from tuteset overlay

    Given I login to the site as "Other Normal User"
    When I clicked on ".Net" link
    And I clicked on "Add to tute set" icon of the first blog
    And I select "tute_kaushik" tuteset from the overlay
    Then The blog should be added to the tuteset
    And On removing the blog from tuteset, count should be updated
    And This is the end of testcase

 # Verify the node listing page

  @TC049a @main @sanity @regression @positive @medium
  Scenario: Verify the node fields on node listing page

    Given I login to the site as "Normal User"
    When I clicked on "Find Projects >> Site Testing" link
    Then I should see the "Find Projects >> QA" breadcrumb
    And I should see the following fields in the Project detail
      | Project Title       |
      | Meta data           |
      | Project Description |
      | Project Creator ID  |
      | Voting bar          |
    And User Card should be displayed on mousehover to userID
    And This is the end of testcase

  @TC049b @main @sanity @regression @positive @medium
  Scenario: Verify the node fields on node listing page

    Given I login to the site as "Normal User"
    When I clicked on "Find Projects >> Site Testing" link
    Then I should see the "Find Projects >> QA" breadcrumb
    And I should see the following sections On the Right rail of the Node Listing Page
      | Posted date dropdown |
      | Budget date dropdown |
      | Job Type             |
      | Max 5 Featured Posts |
      | Tags                 |
    And This is the end of testcase

