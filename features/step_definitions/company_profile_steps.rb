Then(/^I should land on "Company Profile" page$/) do
  @page = @page.assert_company_profile
end

And(/^I should see the following Company Profile information$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_company_profile_information(fields)
  end
end

And(/^Company Address Section should have Add Address button & Address grid$/) do
  @page = @page.assert_add_company_address_btn
  @page = @page.assert_company_address_grid
end

And(/^I should see the following Company Chat information$/) do |table|
  table.raw.flatten.each do |chat|
    @page = @page.assert_company_chat_information(chat)
  end
end

And(/^History link should be present$/) do
  @page = @page.assert_chat_history_link
end

And(/^I should see the following fields under Employees section$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_employees_section(fields)
  end
end

And(/^I should see the following fields under Profiles Section$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_user_profile_section(fields)
  end
end

And(/^I should see the following fields under Other Information Section$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_other_information_section(fields)
  end
end

And(/^I should see the following information under Financial Information Section$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_financial_information_section(fields)
  end
end

And(/^I should see Company Transaction History Section on clicking Company Dashboard link$/) do
  @page = @page.assert_company_transaction_history_section
end

And(/^I should see the following fields under Company Activity Updates section$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_company_activity_updates_section(fields)
  end
end

And(/^I should see the following under Profile Files Section$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_profile_files_section(fields)
  end
end