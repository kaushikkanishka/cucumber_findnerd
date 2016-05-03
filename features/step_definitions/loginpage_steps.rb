
And(/^I enter (.*) as username and (.*) as password for SignIn$/) do |username1, password1|
  @page = @page.enter_login_username(username1)
  @page = @page.enter_login_password(password1)
end

And(/^I clicked Remember me checkbox$/) do
  @page = @page.select_remember_me_checkbox
end

And(/^I clicked on SignIn button$/) do
  @page = @page.click_signin_button
end

And(/^I enter (.*) as username for SignIn$/) do |username|
  @page = @page.enter_login_username(username)
end

And(/^I enter (.*) as password for SignIn$/) do |password|
  @page = @page.enter_login_password(password)
end