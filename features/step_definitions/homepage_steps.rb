Then(/^User should be able to see the following links$/) do |table|
  table.raw.flatten.each do |navigation_link|
    @page = @page.assert_homepage_links(navigation_link)
  end
end