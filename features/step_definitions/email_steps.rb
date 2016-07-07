Then(/^I open gmail account$/) do
  @page = @page.open_reset_pwd_email
end

And(/^I open the email from "dineshmgkvp@gmail.com"$/) do
  @email1 = @email1.select_first_sender_email
end


Then(/^"([^"]*)" should see the following text$/) do |arg, text|
  pending
end

And(/^I clicked Reset Password link on email$/) do
  @page = @page.email_click_reset_pwd
end


And(/^I clicked "Reset Password" link on email$/) do
  step 'I open gmail account'
  @page = @page.click_email_link
end

And(/^I enter "([^"]*)" as new password$/) do |arg|
  @page = @page.enter_new_password(arg)
end

And(/^Email with "([^"]*)" subject should be received\.$/) do |arg|
  @page = @page.assert_forgot_pwd_email_subject(arg)
end