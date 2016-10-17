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

Then(/^I see the URL$/) do
  @page = @page.getPageURL
end

And(/^I clicked on next button$/) do
  @page = @page.click_next_btn
end

Then(/^I should see Page number link and Next button in the pagination section$/) do
  @page = @page.assert_page_number_link
  @page = @page.assert_pagination_next_btn
end

And(/^I should see the Previous and Next button on clicking between pages link$/) do
  @page = @page.click_page_number_link
  @page = @page.assert_pagination_next_btn
  @page = @page.assert_pagination_prev_btn
end

And(/^I should see next page post on clicking the next button$/) do
  @page = @page.get_page_number
  @page = @page.click_next_btn
  @page = @page.assert_next_page

end

And(/^I should see previous page post on clicking previous button$/) do
  @page = @page.get_page_number
  @page = @page.click_prev_btn
  @page = @page.assert_prev_page
end

And(/^I should not see the next button on clicking last page link$/) do
  @page = @page.click_last_pagination_link
  @page = @page.assert_no_next_button
end


And(/^I should not see the Previous button on clicking first page link$/) do
  @page = @page.click_first_pagination_link
  @page = @page.assert_no_prev_button
end

And(/^Signin overlay should be opened on clicking Follow\/Recomendations\/Offline message link$/) do
  @page = @page.click_userid_follow_link
  @page = @page.assert_signin_overlay
  @page = @page.close_signin_overlay
  @page = @page.click_userid_recomendations_link
  @page = @page.assert_signin_overlay
  @page = @page.close_signin_overlay
  @page = @page.click_userid_Offline_msg_link
  @page = @page.assert_signin_overlay
  @page = @page.close_signin_overlay
end

Then(/^Mousehovering to userID displays the User Card$/) do
  @page = @page.hover_userID
end