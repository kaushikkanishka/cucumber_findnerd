Feature: test

  Scenario: Verify the Home page

    Given I am at Home Page
    Then User should be able to see the following links
      |Findnerd Logo|
      |Nerd Digest|
      |Tech QnA|
      |Find Projects|
      |Sign In|
      |Register|
      |Search|
    And This is the end of testcase
