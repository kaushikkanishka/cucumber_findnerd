#if ENV['REMOTE_SAUCE'] == 'NO'
  # Capybara.register_driver :selenium_chrome do |app|
  #   Capybara::Selenium::Driver.new(app, browser: :"#{ENV['BROWSER']}")
  # end
  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 90 # instead of the default 60
    Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile, http_client: client)
  end
  @session = Capybara::Session.new :selenium
# else
#   # caps = Selenium::WebDriver::Remote::Capabilities.send("#{ENV['BROWSER']}".to_sym)
#   caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['BROWSER'].to_s.to_sym)
#   caps.platform = :Linux
#   Capybara.default_driver = :selenium
#   Capybara.register_driver :selenium_session do |app|
#     Capybara::Selenium::Driver.new(app,
#                                    browser: :remote,
#                                    url: "http://#{ENV['SAUCE_USERNAME']}:" \
#                                             "#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
#                                    desired_capabilities: caps
#                                   )
#   end
#   @session = Capybara::Session.new :selenium_session
# end

Before do |scenario|
  @session = Capybara::Session.new :selenium
  if ENV['SCREENSHOTS'] == 'YES'
    Dir.mkdir 'tmp' unless File.exist? 'tmp'
    if scenario.respond_to?('scenario_outline')
      Dir.mkdir "tmp/#{scenario.source_tag_names[0]}-#{scenario.scenario_outline.name}" \
      unless File.exist? "tmp/#{scenario.source_tag_names[0]}-#{scenario.scenario_outline.name}"
    else
      Dir.mkdir "tmp/#{scenario.source_tag_names[0]}-#{scenario.name}" \
      unless File.exist? "tmp/#{scenario.source_tag_names[0]}-#{scenario.name}"
    end
  end
end

AfterStep do |scenario|
  if ENV['SCREENSHOTS'] == 'YES'
    @step ||= 0

    if scenario.respond_to?('scenario_outline')
      output_path = "tmp/#{scenario.source_tag_names[0]}-#{scenario.scenario_outline.name}/#{@step}" \
                      "#{scenario.scenario_outline.feature.feature_elements[0].send(:steps).to_a[0].name}.png"
      @session.save_screenshot output_path
      embed(output_path, 'image/png', 'SCREENSHOT')
    else
      @session.save_screenshot "tmp/#{scenario.source_tag_names[0]}-#{scenario.name}/#{@step}" \
      "#{scenario.steps.to_a[@step].name}.png"
      embed("tmp/#{scenario.source_tag_names[0]}-#{scenario.name}/#{@step}#{scenario.steps.to_a[@step].name}.png", \
            'image/png', 'SCREENSHOT')
    end
    @step += 1
  end
end

After do |_scenario|
  @session.current_window.close
end

Before('@TC026') do
  @activity_update_text = "Dummy update for testing"
end