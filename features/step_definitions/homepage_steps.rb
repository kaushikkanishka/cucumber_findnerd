Then(/^User should be able to see the following links$/) do |table|
  table.raw.flatten.each do |navigation_link|
    @page = @page.assert_homepage_links(navigation_link)
  end
end

Then(/^I click Registration link$/) do
  @page = @page.click_registration_link
end

And(/^I enter valid data for Registration$/) do
  @Timestamp = @page.read_time_stamp
  @page = @page.enter_username("#{@Timestamp}_username")
  @page = @page.enter_email("#{@Timestamp}_findnerd@mailinator.com")
  @page = @page.enter_password("findnerd123")
  @page = @page.enter_confirm_password("findnerd123")
  @page = @page.click_register_button
end

Then(/^I should see Edit Profile page$/) do
  pending
end

And(/^I should see Terms and Conditions overlay$/) do
  pending
end

