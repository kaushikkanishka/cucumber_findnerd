Then(/^I should see the following text on the Record and Share page$/) do |table|
  table.raw.flatten.each do |option|
    @page = @page.assert_record_and_share_text(option)
  end
end

And(/^"Select Category" option should be selected as default in "Category" dropdown$/) do
  @page = @page.assert_category_default_value
end