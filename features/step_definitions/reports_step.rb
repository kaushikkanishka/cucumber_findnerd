
And(/^I select "([^"]*)" as Year and "([^"]*)" as Month from calender$/) do |arg1, arg2|
  @page = @page.select_report_year(arg1)
  @page = @page.select_report_month(arg2)
end

And(/^I select "([^"]*)" as project and employee from Employee Listing$/) do |arg|
  @page = @page.search_project_reports_page(arg)
  @page = @page.select_project_reports_page(arg)
end

Then(/^Tabular View report should be opened by default$/) do
  @page = @page.assert_tabular_view
end

And(/^The first row should have the following$/) do |table|
  table.raw.flatten.each do |option|
  @page = @page.assert_report_first_row(option)
end
end

And(/^I should see the list of All\/selected Project Members Name as title in Project Report$/) do
  @page = @page.assert_project_members
end

And(/^I should see the Weekly Hours Block below the Project Member names$/) do
  @page = @page.assert_weekly_hours_block
end

And(/^I should see the following in the middle section of calender$/) do |table|
  table.raw.flatten.each do |option|
  @page = @page.assert_calander_middle_section(option)
end
end

And(/^I should see total worked hours in Right Section of Calender with default as zero$/) do
  @page = @page.assert_total_worked_hours
  @page = @page.assert_default_total_worked_hours
end