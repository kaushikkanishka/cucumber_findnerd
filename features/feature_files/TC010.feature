Feature: Verify the browse users functionality
  @sanity @positive @medium

    Scenario: Browse Users

    Given I login to the site as valid user
    When I clicked on "Browse Nerds" link
    And I searched "Kanishka Kaushik" as user
    Then User Id with Image should be displayed
    And Name of user with image should be displayed
    And Status of user should be displayed