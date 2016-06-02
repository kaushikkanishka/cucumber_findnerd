Then(/^I should redirect to Publish Confirmation Page$/) do
  @page = @page.assert_publish_confirmation_page
end

And(/^Publish Confirmation Page should have "([^"]*)" breadcrumb$/) do |breadcrumb|
  @page = @page.assert_publish_confirmation_breadcrumb(breadcrumb)
end

And(/^Publish Confirmation Page should have the following fields$/) do |table|
  table.raw.flatten.each do |assert_fields|
    @page = @page.assert_publish_confirmation_fields(assert_fields)
  end
end

And(/^Publish Confirmation Page should have blog title as "([^"]*)"$/) do |title|
  @page = @page.assert_project_title(title)
end

And(/^Publish Confirmation Page should have Duration as "([^"]*)"$/) do |duration|
  @page = @page.assert_project_duration(duration)
end

And(/^Publish Confirmation Page should have Budget as "([^"]*)"$/) do |budget|
  @page = @page.assert_project_budget(budget)
end

And(/^Publish Confirmation Page should have text as "([^"]*)"$/) do |content|
  @page = @page.assert_project_content(content)
end

And(/^Publish Confirmation Page should have tags as "([^"]*)"$/) do |tags|
  @page = @page.assert_project_tags(tags)
end

And(/^I clicked "Publish" button$/) do
  @page = @page.click_publish_button
end