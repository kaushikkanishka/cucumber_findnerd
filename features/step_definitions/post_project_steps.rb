

Then(/^I should see the following on the page$/) do |table|
  table.raw.flatten.each do |text|
    @page = @page.assert_post_project_elements(text)
  end
end

And(/^"Select Category" option should be selected by default in "Category" dropdown$/) do
  @page = @page.assert_category_dropdown_default_value
end

And(/^I should see the following dropdown on selecting "Fixed Price" radio button$/) do |table|
  @page = @page.click_fixed_price_radio_btn
  table.raw.flatten.each do |dropdown|
    @page = @page.assert_post_project_elements(dropdown)
  end
end

And(/^I should see the following dropdown on selecting "Hourly Price" radio button$/) do |table|
  @page = @page.click_hourly_price_radio_btn
  table.raw.flatten.each do |dropdown1|
    @page = @page.assert_post_project_elements(dropdown1)
  end
end

And(/^I should see the following under "Company status Information" section$/) do |table|
  table.raw.flatten.each do |value|
    @page = @page.assert_company_status_information(value)
  end
end

And(/^I attached a "([^"]*)" file$/) do |filename|
  @page = @page.attach_blog_file(filename)
end

And(/^I select "([^"]*)" from "Category" dropdown$/) do |option|
  @page = @page.select_category_from_dropdown(option)
end

And(/^I enter the blog title as "([^"]*)"$/) do |arg|
  @blog_title = arg.strip
  @page = @page.enter_blog_title(@blog_title)
end

And(/^I enter "([^"]*)" as dummy text$/) do |arg|
  @dummy_text = arg.strip
  @page = @page.enter_blog_content(@dummy_text)
end

And(/^I enter "([^"]*)" as dummy tags$/) do |arg|
  @dummy_tags = arg.strip
  @page = @page.enter_blog_tags(@dummy_tags)
end

And(/^I clicked the "Preview" button$/) do
  @page = @page.click_preview_button
end

And(/^I select "([^"]*)" option from Duration dropdown$/) do |duration|
  @duration_value = duration.strip
  @page = @page.select_duration_value(@duration_value)
end

And(/^I select "([^"]*)" option from Budget dropdown$/) do |budget|
  @budget_value = budget.strip
  @page = @page.select_budget_value(@budget_value)
end
