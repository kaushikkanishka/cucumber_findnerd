
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
