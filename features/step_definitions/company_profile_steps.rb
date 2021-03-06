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
  @page = @page.click_company_dashboard_link
  @page = @page.assert_company_transaction_history_section
  @page = @page.browser_back_button
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

And(/^I enter message (.*) in the Chat Area$/) do |message|
  @message = message
  @page = @page.enter_chat_message(@message)
end

Then(/^I should see the User Profile image and User ID in message section$/) do
  @page = @page.assert_chat_user_profile_image
  @page = @page.assert_chat_user_id
end

And(/^I should see "([^"]*)" as the chat text$/) do |arg|
  @page = @page.assert_send_chat_message(arg)
end

And(/^I should see "([^"]*)" for the instantly send message$/) do |arg|
  @page = @page.assert_instant_message_time(arg)
end


When(/^I again send (.*) as chat message$/) do |arg|
  step "I enter message #{arg} in the Chat Area"
end

Then(/^I should see "\(x\) second\(s\) ago" for the previous chat message$/) do
  @page = @page.assert_previous_chat_message
end

And(/^Chat text "([^"]*)" should be displayed to all Users involved in the online Chat$/) do |arg|
  step "This is the end of testcase"
  step "I login to the site as '#{Other Normal User}'"
  step "I clicked on 'Company' link from left navigation"
  step "I should see '#{arg}' as the chat text"

end

And(/^User should be navigated to User Profile page on clicking the user\-id$/) do
  @page = @page.click_chat_user_id
end

Then(/^I should see the following chat message fields$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_chat_fields(fields)
  end
end

Then(/^I should see "([^"]*)" tooltip on mouse hover to “Add Employee” Button$/) do |arg|
  @page = @page.assert_add_employee_tooltip(arg)
end

And(/^I should see the form title "([^"]*)" on clicking the “Add Employee” Button$/) do |arg|
  @page = @page.click_add_employee_button
  @page = @page.assert_add_employee_form_title(arg)
end

And(/^I should see the following fields in the form$/) do |table|
  table.raw.flatten.each do |fields|
    @page = @page.assert_add_employee_form_fields(fields)
  end
end

And(/^I clicked on “Add Employee” Button$/) do
  @page = @page.click_add_employee_button
end

And(/^I enter "([^"]*)" in the Employee search textbox$/) do |arg|
  @page = @page.enter_name_employee_search(arg)
end


And(/^I click “Search” Button on Search Form pop\-up$/) do
  @page = @page.click_search_btn_company_search
end

Then(/^I should see "([^"]*)" tooltip for uninvited users$/) do |arg|
  @page = @page.assert_tooltip_new_user(arg)
end

And(/^I should see "([^"]*)" tooltip for invitation send users$/) do |arg|
  @page = @page.assert_tooltip_invitation_send(arg)
end

And(/^I should see "([^"]*)" tooltip for rejected invitations$/) do |arg|
  @page = @page.assert_tooltip_invitation_rejected(arg)
end

And(/^I should see "([^"]*)" tooltip for existing users of company$/) do |arg|
  @page = @page.assert_tooltip_invitation_accepted(arg)
end

Then(/^I clicked on Company Dashboard link$/) do
  @page = @page.click_company_dashboard_link
end

And(/^I should see Transactions page by default$/) do
  @page = @page.assert_company_transaction_history_section
end

And(/^I should see last (\d+) days transactions$/) do |arg|
  @page = @page.assert_transaction_period(arg)
end

And(/^I entered "Dummy update for testing" in company activity section$/) do
  @page = @page.enter_activity_text(@activity_update_text)
end

And(/^I uploaded a test image$/) do
  @page = @page.image_upload_company_profile
end

And(/^I entered "([^"]*)" in link textbox$/) do |arg|
  @page = @page.click_upload_link_company_profile
  @page = @page.upload_link_company_profile(arg)
  @page = @page.company_profile_submit_link_btn
end

And(/^I clicked Activity Update send button$/) do
  @page = @page.click_activity_update_send_button
end

And(/^The Posted activity should contain following items$/) do |table|
  table.raw.flatten.each do |item|
    @page = @page.assert_activity_update_items(item)
  end
end

Then(/^I should see "Dummy update for testing" in Activity Update Section$/) do
  @page = @page.assert_msg_activity_update_section(@activity_update_text)
end