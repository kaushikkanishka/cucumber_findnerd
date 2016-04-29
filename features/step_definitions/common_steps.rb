
Given 'I am at Home Page' do
  @page = Homepage.new @session
  @page.open_site
end

Then(/^I enter username$/) do
  pending
end

Given(/^I am at the Home Page$/) do
  pending
end