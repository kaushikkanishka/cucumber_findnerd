Then(/^I open gmail account$/) do
  array = @page.fetch_gmail_username_password("GmailUser")
  gmail_username = array[0].strip
  gmail_password = array[1].strip
  @page = @page.open_gmail_email(gmail_username, gmail_password)
end

And(/^I clicked Reset Password link on email$/) do
  @page = @page.email_click_reset_pwd
end


And(/^I clicked "Reset Password" link on email$/) do
  step 'I open gmail account'
  @page = @page.click_email_link
end

And(/^I enter the new password$/) do
  new_password = @page.fetch_value_from_config("New_Password")
  @page = @page.enter_new_password(new_password)
end

And(/^Email with "([^"]*)" subject should be received\.$/) do |arg|
  step 'I open gmail account'
  @page = @page.assert_forgot_pwd_email_subject(arg)
end