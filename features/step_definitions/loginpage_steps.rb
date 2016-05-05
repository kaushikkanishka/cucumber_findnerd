
And(/^I enter (.*) as username and (.*) as password for SignIn$/) do |username1, password1|
  @page = @page.enter_login_username(username1)
  @page = @page.enter_login_password(password1)
end

And(/^I clicked Remember me checkbox$/) do
  @page = @page.select_remember_me_checkbox
end

And(/^I clicked on SignIn button$/) do
  @page, @navi = @page.click_signin_button
end

And(/^I enter (.*) as username for SignIn$/) do |username|
  @page = @page.enter_login_username(username)
end

And(/^I enter (.*) as password for SignIn$/) do |password|
  @page = @page.enter_login_password(password)
end

When(/^I Clicked on “Sign in with LinkedIn” Button$/) do
  @page = @page.click_linkedIn_signIn_button
end

And(/^I enter (.*) as username in LinkedIn overlay$/) do |linkedIn_username|
  @page = @page.enter_linkedIn_username(linkedIn_username)
end

And(/^I enter (.*) as password in LinkedIn overlay$/) do |linkedIn_password|
  @page = @page.enter_linkedIn_password(linkedIn_password)
end

And(/^I clicked on "Allow Access" button$/) do
  @page = @page.click_linkedIn_allow_access_button
end

Then(/^I switched to linkedIn Popup$/) do
  @page = @page.switched_to_linkedin_popup
end