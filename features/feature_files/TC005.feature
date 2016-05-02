Feature:
  Scenario:Verify the registration

    Given I am at Home Page
    Then I click Registration link
    And I enter valid data for Registration
    Then I should see Edit Profile page
    And I should see Terms and Conditions overlay