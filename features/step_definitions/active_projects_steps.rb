And(/^I clicked on "Setup new Project" button$/) do
  @page = @page.click_setup_project_button
end

Then(/^I should see the Text Box with "Enter Project Title" as placeholder$/) do
  @page = @page.assert_new_project_title_placeholder
end

And(/^I should see Save and Close on entering the title$/) do
  @page = @page.assert_new_proj_save_close_btn
end

And(/^I entered the Project title$/) do
  @page = @page.enter_new_project_proj_title
end

And(/^I clicked the Save button$/) do
  @page = @page.click_new_proj_save_btn
end

Then(/^I should see the Project Dashboard$/) do
  @page = @page.assert_proj_dashboard
end

And(/^I created a new project$/) do
  # step "I clicked on 'Setup new Project' button"
  @page = @page.click_setup_project_button
  step 'I entered the Project title'
  step 'I clicked the Save button'
end

Then(/^I should see My Active Project Page$/) do
  step 'I created a new project'
  @page = @page.assert_active_project_page
end

And(/^I should see the "([^"]*)" breadcrumb$/) do |arg|
  @page = @page.assert_active_project_breadcrumb(arg)
end

And(/^I should see the Search Box with Search Button$/) do
  @page = @page.assert_new_proj_search_box
  @page = @page.assert_new_proj_search_button
end

And(/^I should see Setup a new project in "Tile Grid"$/) do
  @page = @page.assert_active_project_page
end

And(/^I should see the following fields in the Project detail$/) do |table|
  table.raw.flatten.each do |option|
    @page = @page.assert_active_proj_list_fields(option)
  end
end

And(/^Pagination for project count greater than six$/) do
  @page = @page.assert_project_count
end