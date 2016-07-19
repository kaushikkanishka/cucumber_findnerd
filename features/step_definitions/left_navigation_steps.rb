When(/^I clicked on Draft link$/) do
  @page = @navi.click_draft_link
end

When(/^I clicked on "Browse Nerds" link$/) do
  @page = @navi.click_browse_nerds_link
end

When(/^I clicked on "Post Project" link$/) do
  @page = @navi.click_post_project_link
end

And(/^I clicked on "Edit Company Profile" link$/) do
  @page = @navi.edit_company_profile_link
end

When(/^I clicked on "Company" link from left navigation$/) do
  @page = @navi.click_company_link
end


When(/^I clicked on "Company Chat" link from left navigation$/) do
  @page = @navi.click_company_chat_link
end


When(/^I clicked on "Manage Reports" link from left navigation$/) do
  @page = @navi.click_manage_reports_link
end

When(/^I clicked on "Record & Share" link$/) do
  @page, @recordshare = @navi.click_record_share_link
end

When(/^I clicked on "Automation" link$/) do
  @page = @navi.click_automation_link
end

When(/^I clicked on "My Active Projects" link$/) do
  @page = @navi.click_active_projects_link
end

When(/^I clicked on "Tute Sets" link$/) do
  @page = @navi.click_tute_sets_link
end