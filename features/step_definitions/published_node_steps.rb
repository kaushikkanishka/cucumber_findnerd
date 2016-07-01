Then(/^I should be see the following message$/) do |table|
table.raw.flatten.each do |message|
  @page = @page.assert_publish_confirmation_message(message)
end
end

And(/^Publish & Back buttons should disappear$/) do
  @page = @page.assert_no_publish_button
  @page = @page.assert_no_back_button
end

And(/^Post\/Node should be submitted to admin approval\/rejection$/) do
  @page = @page.assert_admin_approval_message
end

And(/^Post should be displayed under "My Content>>Published Page"$/) do
  @page = @page.assert_published_project

end

Then(/^I should see "([^"]*)" message$/) do |arg|
  @page = @page.assert_published_node_message(arg)
end

And(/^I should not see the following$/) do |table|
  table.raw.flatten.each do |option|
    @page = @page.assert_element_not_present(option)
  end
end

