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

And(/^I clicked on "([^"]*)" tag from right rail tag Section$/) do |arg|
  @page = @page.click_tag(arg)
end

Then(/^I should see "([^"]*)" tag above the Featured Section$/) do |arg|
  @page = @page.assert_tags_above_featured_section(arg)
end

And(/^I should see posts\/articles\/nodes having "([^"]*)" tag$/) do |arg|
  @page = @page.select_first_post
  @page = @page.assert_selected_tag_posts(arg)
  @page = @page.browser_back_button
end

And(/^"([^"]*)" tag should be removed on clicking the cross button$/) do |arg|
  @page = @page.click_tag_cross_button(arg)
end

And(/^I should also see posts\/articles\/nodes having "([^"]*)" tag$/) do |arg|
  @page = @page.open_respective_tag_post(arg)
end