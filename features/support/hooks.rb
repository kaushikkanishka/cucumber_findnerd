Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 90
  Capybara::Selenium::Driver.new(app,browser:firefox,profile:profile,http_client:client)
end
@session = Capybara::Session.new :selenium