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