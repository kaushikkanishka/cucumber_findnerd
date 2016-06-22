Then(/^I should see the Activities page$/) do
  @page = @page.assert_activities_breadcrumb
end

And(/^I should also see update on Workroom page under Company Updates$/) do
  @page = @page.click_company_updates
  @page = @page.assert_message_company_updates_tab(@activity_update_text)
end