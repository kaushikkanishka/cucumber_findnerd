Then(/^I should see the following text on the Record and Share page$/) do |table|
  table.raw.flatten.each do |option|
    @page = @page.assert_record_and_share_text(option)
  end
end

And(/^"Select Category" option should be selected as default in "Category" dropdown$/) do
  @page = @page.assert_category_default_value
end

And(/^I created a node$/) do
  @page = @postproj.select_category_from_dropdown(@category)
  @page = @page.enter_blog_title(@blog_title)
  @page = @page.enter_blog_content(@dummy_text)
  @page = @page.enter_blog_tags(@dummy_tags)
  @page = @page.click_preview_button
end


And(/^I selected "([^"]*)" from "Category" dropdown$/) do |arg1|
  @page = @page.select_category_from_dropdown(arg1)
end