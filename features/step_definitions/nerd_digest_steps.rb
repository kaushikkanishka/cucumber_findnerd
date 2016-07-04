Then(/^I should see the node display page$/) do
  @page = @page.assert_nerd_digest_breadcrumb
end

And(/^I should see the functions similar to “Nerd Digest” page$/) do
  @page = @page.assert_nerd_digest_page
end