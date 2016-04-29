class Base
  include RSpec::Matchers
  def open_site
    @session.visit read_url ENV['ENVIRONMENT']
    Capybara.default_max_wait_time = 30
    self
  end

  def read_url(env)
    urls = YAML.load_file(File.dirname(__FILE__) + '/../../lib/urls.yml')
    urls['URLS'][env]
  end

  def read_time_stamp
    @time = Time.now.utc.strftime('%Y%m%d%H%M%S')
  end
end