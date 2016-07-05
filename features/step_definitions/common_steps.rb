
Given 'I am at Home Page' do
  @page = Homepage.new @session
  @page.open_site
end

And 'This is the end of testcase' do
  @page = @page.click_sign_out_link
end

Then(/^I should be logged in to the site$/) do
  @page = @page.assert_login_link
end

And(/^I clicked on SignIn link$/) do
  @page = @page.click_signin_link
end

And(/^I open the email$/) do
  puts @page.inspect
  puts @email.inspect
  @page = @email.open_reset_pwd_email()
  #@page = @page.open_email(@forgot_pwd_email)
end

# Then(/^I open gmail account$/) do
#   @page = @page.open_reset_pwd_email
# end


And(/^I should see the User Profile image and User ID$/) do
  @page = @page.assert_user_profile_image
  @page = @page.assert_user_id
end

And(/^I select the first nerd$/) do
  @page = @page.select_first_nerd
end