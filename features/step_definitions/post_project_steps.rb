

Then(/^I should see the following on Post Project page$/) do |table|
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