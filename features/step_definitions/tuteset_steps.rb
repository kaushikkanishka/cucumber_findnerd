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