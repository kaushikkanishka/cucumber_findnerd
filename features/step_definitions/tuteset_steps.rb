And(/^I should see the message "No Tuteset found !!" if no Tute is published$/) do
  @page = @page.assert_zero_tuteset_message
end