Then(/^I should see the node display page$/) do
  @page = @page.assert_nerd_digest_breadcrumb
end

And(/^I should see the functions similar to “Nerd Digest” page$/) do
  @page = @page.assert_nerd_digest_page
end

And(/^I clicked on "Add to tute set" icon of the first blog$/) do
  @page = @page.get_dotnet_first_blog_title
  @page = @page.add_blog_to_tuteset
end

And(/^I select "([^"]*)" tuteset from the overlay$/) do |arg|
  @page = @page.select_tuteset_from_overlay(arg)
end

Then(/^The blog should be added to the tuteset$/) do
  @page = @page.assert_userTuteCount_after_addition
end