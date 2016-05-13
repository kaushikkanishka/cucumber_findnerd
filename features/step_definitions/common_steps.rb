
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

Given(/^I login to the site as valid user$/) do
  @page = Homepage.new @session
  @page = @page.open_site
  @page = @page.click_signin_link
  @page = @page.enter_login_username('qapeter')
  @page = @page.enter_login_password('123456')
  @page, @navi = @page.click_signin_button
end

When(/^I clicked on "Browse Nerds" link$/) do
   @page = @navi.click_browse_nerds_link
end

When(/^I clicked on "Post Project" link$/) do
  @page = @navi.click_post_project_link
end

And(/^I open the email$/) do
  puts @page.inspect
  puts @email.inspect
  @page = @email.open_reset_pwd_email()
  #@page = @page.open_email(@forgot_pwd_email)
end