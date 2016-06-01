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

  def click_sign_out_link
    @session.find('.loginArrow').click
    @session.find('.signOutQuit>a').click
    Homepage.new(@session)
  end

  def assert_login_link
    expect(@session).not_to have_css('.sign>a')
    self
  end

  def attach_blog_file(filename)
    @session.within_frame 'mainiframe' do
      @session.find('#last').click
      sleep 5
      @session.attach_file('uploader', File.absolute_path('/home/kanishka/Documents/testImage.png'))
      end
    sleep 3
    self
  end
end