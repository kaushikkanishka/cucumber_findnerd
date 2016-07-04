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