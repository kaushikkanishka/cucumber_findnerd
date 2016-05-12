And(/^I open the email$/) do
  puts @page.inspect
  @page = @page.open_reset_pwd_email(@forgot_pwd_email)
  #@page = @page.open_email(@forgot_pwd_email)
end