And(/^I searched "([^"]*)" as user$/) do |arg|
  @nerd_name = arg
  @page = @page.search_user(arg)
end

Then(/^User Id with Image should be displayed$/) do
  @page = @page.assert_user_id(@nerd_name)
end

And(/^Name of user with image should be displayed$/) do
  pending
end

And(/^Status of user should be displayed$/) do
  pending
end