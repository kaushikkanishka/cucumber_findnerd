And(/^I should see the message "No Tuteset found !!" if no Tute is published$/) do
  @page = @page.assert_zero_tuteset_message
end

Then(/^I should see the tuteset$/) do
  @page = @page.assert_tuteset_presence
end

And(/^I should see the following items in the tuteset$/) do |table|
  table.raw.flatten.each do |item|
    @page = @page.assert_tuteset_items(item)
  end
end

And(/^I clicked the tuteset$/) do
  @page = @page.click_tuteset_title
end

Then(/^I should see the overlay with the following items$/) do |table|
  table.raw.flatten.each do |item|
   @page = @page.assert_tute_overlay_items(item)
  end
   @page = @page.close_tute_overlay
end

And(/^I clicked the first blog title$/) do
  @page = @page.click_first_blog_title
end

Then(/^I should see the blog detail page$/) do
  @page = @page.assert_blog_title
end

And(/^I clicked the Up arrow of a blog$/) do
  @page = @page.get_initial_position_of_blog_tuteset
  @page = @page.click_up_arrow_of_blog
end

Then(/^The blog should be moved one position upwards$/) do
  @page = @page.assert_position_of_blog_for_up_arrow
end


And(/^I clicked the Down arrow of a blog$/) do
  @page = @page.get_initial_position_of_blog_tuteset
  @page = @page.click_down_arrow_of_blog
end

Then(/^The blog should be moved one position downwards$/) do
  @page = @page.assert_position_of_blog_for_down_arrow
end

And(/^On removing the blog from tuteset, count should be updated$/) do
  @page = @page.click_tute_sets_link
  @page = @page.click_tuteset_title
  @page = @page.remove_from_tuteset
  @page = @page.click_dot_net_link
  @page = @page.assert_userTuteCount_after_deletion
end