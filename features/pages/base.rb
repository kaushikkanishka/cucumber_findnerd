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
    @session.find('.loginArrow', visible: false).click
    @session.find('.signOutQuit>a', visible: false).click
    Homepage.new(@session)
  end

  def assert_login_link
    expect(@session).not_to have_css('.sign>a')
    self
  end

  def browser_back_button
    @session.evaluate_script('window.history.back()')
    sleep 3
    self
  end

  def read_config(user_key)
    config = YAML.load_file(File.dirname(__FILE__) + '/../../lib/login_config.yml')
    config[ENV['ENVIRONMENT']][user_key]
  end

  def fetch_username_password(user_key_from_login_config)
    read_config(user_key_from_login_config).split('~')
  end

  def fetch_gmail_username_password(gmail_key_from_login_config)
    read_config(gmail_key_from_login_config).split('~')
  end

  def fetch_value_from_config(key_from_login_config)
    read_config(key_from_login_config)
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

  def assert_user_profile_image
    @session.within_frame 'mainiframe' do
      a = @session.find(:xpath, "//*[@class='userBox']/img")['src']
      expect(a.length).should_not == 0
    end
    self
  end

  def assert_user_id
    @session.within_frame 'mainiframe' do
      a = @session.find(:xpath, "//*[@class='userShareCover']/a[@itemprop='creator']").text
      expect(a.length).should_not == 0
    end
    self
  end

  def select_first_nerd
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='itemContent']/../../div[1]/div[@class='itemContent']/h4/a").click
    end
    self
  end

  def assert_active_project_breadcrumb(arg)
    @session.within_frame 'mainiframe' do
      breadcrumb = Array.new
      @session.all(:xpath, "//*[@class='breadcrumb']/li").each do |value|
        breadcrumb.push value.text.strip
      end
      expect(breadcrumb.join(" ")).to eq(arg)
    end
    self
  end

  def search_blog(blog_name)
    @session.find('#q').set(blog_name)
    @session.find('#submitbutton').click
    self
  end

  def first_blog_title_click
    @session.within_frame 'mainiframe' do
      @blog_title = @session.find(:xpath, "//*[@class='span4'][1]//a[@class='itemHeading']").text
      @session.find(:xpath, "//*[@class='span4'][1]//a[@class='itemHeading']").click
    end
    TuteSet.new(@session)
  end
end