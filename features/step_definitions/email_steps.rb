Then(/^I open gmail account$/) do
  @email1 = @email1.open_reset_pwd_email
end

And(/^I open the email from "dineshmgkvp@gmail.com"$/) do
  @email1 = @email1.select_first_sender_email
end


Then(/^"([^"]*)" should see the following text$/) do |arg, text|
  pending
end