Then(/^I should see the Activities page$/) do
  @page = @page.assert_activities_breadcrumb
end