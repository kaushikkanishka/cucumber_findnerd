class TuteSet < Base
  def initialize(session)
    @session = session
  end

  def assert_zero_tuteset_message
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='leftContent']/p[contains(text(), 'No Tuteset found !!')]")
    end
    self
  end

  def assert_tuteset_presence
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@class='tuteContainer']//div[@class='span4']")
    end
    self
  end

  def assert_tuteset_items(item)
    @session.within_frame 'mainiframe' do
      tute = "//*[@class='tuteContainer']//a[@class='itemHeading tuteItem'][contains(text(),'tute_kaushik')]"
      case item
        when 'Tute Set Name as title'
          expect(@session).to have_xpath(tute)
        when 'Count of blogs in the tute set'
          blog_count = @session.find(:xpath,"#{tute}/../following-sibling::div/div[@class='tuteCount']/span").text
          is_numeric = true if Float(blog_count) rescue false
          expect(is_numeric).to be(true)
        when 'Share icon'
          expect(@session).to have_xpath("#{tute}/../following-sibling::div/ul[@class='itemStatus']//a[@class='share']")
        when 'View icon'
          expect(@session).to have_xpath("#{tute}/../following-sibling::div/ul[@class='itemStatus']//a[@class='share']")
      end
    end
    self
  end

  def click_tuteset_title
    @session.within_frame 'mainiframe' do
      tute = "//*[@class='tuteContainer']//a[@class='itemHeading tuteItem'][contains(text(),'tute_kaushik')]"
      @session.find(:xpath, tute).click
    end
    self
  end

  def assert_tute_overlay_items(item)
    case item
      when 'Tute Set name'
        expect(@session).to have_xpath("//*[@class='tuteTitleHead'][contains(text(),'tute_kaushik')]")
      when 'Blog titles added in Tute Set'
        expect(@session).to have_xpath("//*[@class='listTutes']/li")
      when 'Up arrow link'
        expect(@session).to have_xpath("//*[@class='listTutes']/li/div[@class='arrowsGroup']/a[@class='listUp']")
      when 'Down arrow Link'
        expect(@session).to have_xpath("//*[@class='listTutes']/li/div[@class='arrowsGroup']/a[@class='listDown']")
      when 'Delete icon links'
        expect(@session).to have_xpath("//*[@class='listTutes']/li/div[@class='arrowsGroup']/a[@class='listDelete']")
      when 'Close(X) icon'
        expect(@session).to have_xpath("//*[@class='blogListing']//span[@class='crossOver']")
    end
    self
  end

  def close_tute_overlay
    @session.find(:xpath, "//*[@class='blogListing']//span[@class='crossOver']").click
    self
  end

  def click_first_blog_title
    @blog_title = @session.find(:xpath, "//*[@class='listTutes']/li[1]/span/a").text
    @session.find(:xpath, "//*[@class='listTutes']/li[1]/span/a").click
    self
  end

  def assert_blog_title
    @session.within_frame 'mainiframe' do
      expect(@session.find('.titleList.nodeTitle').text.strip).to eq(@blog_title.strip)
    end
    self
  end

  def click_up_arrow_of_blog
    @session.find(:xpath, "//*[@class='listTutes']/li[3]/div[@class='arrowsGroup']/a[@class='listUp']").click
    self
  end

  def get_initial_position_of_blog_tuteset
    @blog_title1 = @session.find(:xpath, "//*[@class='listTutes']/li[3]/span/a").text
    xpath2 = "//*[@class='listTutes']/li/span/a[contains(text(),'#{@blog_title1}')]/../../preceding-sibling::*"
    a = @session.all(:xpath, xpath2).size
    @initial_position = a + 1
    self
  end

  def assert_position_of_blog_for_up_arrow
    sleep 2
    xpath1 = "//*[@class='listTutes']/li/span/a[contains(text(),'#{@blog_title1}')]/../../preceding-sibling::*"
    b = @session.all(:xpath, xpath1).size
    next_position = b + 1
    expect(next_position).to eq(@initial_position-1)
    @session.find(:xpath, "//*[@class='blogListing']//span[@class='crossOver']").click
    self
  end

  def click_down_arrow_of_blog
    @session.find(:xpath, "//*[@class='listTutes']/li[3]/div[@class='arrowsGroup']/a[@class='listDown']").click
    self
  end

  def assert_position_of_blog_for_down_arrow
    sleep 2
    xpath1 = "//*[@class='listTutes']/li/span/a[contains(text(),'#{@blog_title1}')]/../../preceding-sibling::*"
    b = @session.all(:xpath, xpath1).size
    next_position = b + 1
    expect(next_position).to eq(@initial_position + 1)
    @session.find(:xpath, "//*[@class='blogListing']//span[@class='crossOver']").click
    self
  end

  def remove_from_tuteset
    @session.find(:xpath, "//*[@class='listTutes']/li[last()]//a[@class='listDelete']").click
    @session.accept_alert
    close_tute_overlay
    LeftNavigation.new(@session)
  end

  def hover_share_icon
    @session.within_frame 'mainiframe' do
      # @session.find('.share').hover
      @session.find('.share').click
    end
    self
  end

  def assert_share_with_friends_overlay
    @session.within_frame 'mainiframe' do
      @session.within_frame 'stLframe' do
        expect(@session).to have_xpath("//*[@id='popular'][text()='Share this with friends!']")
      end
    end
    self
  end

  def click_twitter_icon
    @session.within_frame 'mainiframe' do
      @session.within_frame 'stLframe' do
        @session.find('#post_twitter_link').click
      end
    end
    self
  end

  def switch_twitter_window(username, password)
      @session.switch_to_window(@session.windows.last)
      @session.find('#username_or_email').set(username)
      @session.find('#password').set(password)
      @session.find('.button.selected.submit').click
      @session.find(:xpath, "//*[@class='button selected submit'][@value='Tweet']").click
    self
  end

  def close_twitter_window
    @session.find('#btn-close').click
    @session.switch_to_window(@session.windows.first)
    self
  end


end

