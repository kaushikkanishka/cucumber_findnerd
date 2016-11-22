class NerdDigest < Base
  def initialize(session)
    @session = session
  end

  def assert_nerd_digest_breadcrumb
    @session.within_frame 'mainiframe' do
      breadcrumb = Array.new
      @session.all(:xpath, "//*[@class='breadcrumb']/li").each do |value|
        breadcrumb.push value.text.strip
      end
      expect(breadcrumb.join(" ")).to eq("Home >> Nerd Digest >> Automation")
    end
    self
  end

  def assert_nerd_digest_page
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('#no_bid')
    end
    self
  end

  def click_tag(tag)
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@id='tagDisplay']//span[text()='#{tag}']").click
      sleep 3
    end
    self
  end

  def assert_tags_above_featured_section(arg)
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='selTags']/div[text()='#{arg}']")
    end
    self
  end

  def assert_selected_tag_posts(arg)
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@class='tagName']//a/span[text()=' #{arg} ']")
    end
    self
  end

  def select_first_post
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='row']/div[1]//a[@class='itemHeading']").click
    end
    self
  end

  def click_tag_cross_button(arg)
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@id='selTags']/div[text()='#{arg}']/a").click
    end
    self
  end

  # def open_respective_tag_post(arg)
  #   @session.within_frame 'mainiframe' do
  #     @session.all(:xpath, "//*[@id='leftContent']//div[@class='itemContent']//a[text()='Automation']/../../../..[1]")
  #   end
  #   self
  # end

  def getPageURL
    @session.within_frame 'mainiframe' do
      puts "current_url = #{@session.current_url}"
    end
    self
  end

  def click_next_btn
    @session.within_frame 'mainiframe' do
      @session.find('.next_page').click
      sleep 5
    end
    self
  end

  def click_prev_btn
    @session.within_frame 'mainiframe' do
      @session.find('.prev_page').click
      sleep 5
    end
    self
  end

  def assert_page_number_link
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@class='paginate paginajax']/a[1]").text.to_i).to eq(2)
    end
    self
  end

  def assert_pagination_next_btn
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('.next_page')
    end
    self
  end

  def assert_pagination_prev_btn
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('.prev_page')
    end
    self
  end

  def click_page_number_link
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='paginate paginajax']/a[1]").click
      sleep 5
    end
    self
  end

  def assert_next_page
    @session.within_frame 'mainiframe' do
      page_number = @session.current_url.split('nodes/NerdDigest/')
      expect(page_number[1].to_i).to eq(@current_page_number+1)
    end
    self
  end

  def get_page_number
    @session.within_frame 'mainiframe' do
      current_page = @session.current_url.split('nodes/NerdDigest/')
      @current_page_number = current_page[1].to_i
    end
    self
  end

  def assert_prev_page
    @session.within_frame 'mainiframe' do
      page_number = @session.current_url.split('nodes/NerdDigest/')
      expect(page_number[1].to_i).to eq(@current_page_number-1)
    end
    self
  end

  def click_last_pagination_link
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='paginate paginajax']/a[last()]/preceding-sibling::a[1]").click
      sleep 5
    end
    self
  end

  def click_first_pagination_link
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='paginate paginajax']/a[1]/following-sibling::a[1]").click
      sleep 5
    end
    self
  end

  def assert_no_next_button
    @session.within_frame 'mainiframe' do
      expect(@session).not_to have_css('.next_page')
    end
    self
  end

  def assert_no_prev_button
    @session.within_frame 'mainiframe' do
      expect(@session).not_to have_css('.prev_page')
    end
    self
  end

  def click_userid_follow_link
      a = "//*[@class='itemContent']/../../div[1]//div[@class='userShareCover'][contains(@onmouseover,'showUserShare')]"
      @session.find(:xpath, a).hover
      b= "#{a}//div[@class='userInfoCard']/a[@class='follow']"
      @session.find(:xpath, "#{a}//div[@class='userInfoCard']/a[@class='follow']").click
      Login.new(@session)
  end

  def click_userid_recomendations_link
      a = "//*[@class='itemContent']/../../div[1]//div[@class='userShareCover'][contains(@onmouseover,'showUserShare')]"
      @session.find(:xpath, a).hover
      b= "#{a}//div[@class='userInfoCard']/a[@class='follow']"
      @session.find(:xpath, "#{a}//div[@class='userInfoCard']/a[@class='recommend']").click
      Login.new(@session)
  end

  def click_userid_Offline_msg_link
      a = "//*[@class='itemContent']/../../div[1]//div[@class='userShareCover'][contains(@onmouseover,'showUserShare')]"
      @session.find(:xpath, a).hover
      b= "#{a}//div[@class='userInfoCard']/a[@class='follow']"
      @session.find(:xpath, "#{a}//div[@class='userInfoCard']/a[@class='offlinemessage']").click
      Login.new(@session)
  end

  def hover_userID
    a = "//*[@class='itemContent']/../../div[1]//div[@class='userShareCover'][contains(@onmouseover,'showUserShare')]"
    expect(@session).to have_xpath(a)
    self
  end

  def click_nerd_listing_add_tute
    @session.within_frame 'mainiframe' do
      @tuteCount = @session.find(:xpath, "//*[@class='span4'][1]//span[@class='userTuteCount']").text
      @@itemHeading = @session.find(:xpath, "//*[@class='span4'][1]//a[@class='itemHeading']").text.strip
      @session.find(:xpath, "//*[@class='span4'][1]//a[@title='Add to tute set']").click
    end
    self
  end

  def assert_tute_overlay
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@class='createNewSet']/..")
    end
    self
  end

  def assert_create_tuteset_box_text(timestamp)
    @session.within_frame 'mainiframe' do
      @@timestamp_saved = timestamp
      @session.find('#searchTuteTab').set(timestamp)
      a = @session.find(:xpath, "//*[@class='createSet']/span").text
      expect(a).to eq(timestamp)
    end
    self
  end

  def click_create_set_btn
    @session.within_frame 'mainiframe' do
      @session.find('.createSet').click
    end
    self
  end

  def assert_create_tuteset_overlay_btn(x, y)
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@class='popupBtnCombo']/button[@class='cancel']").text.strip).to(be==y.strip)
      expect(@session.find(:xpath, "//*[@class='popupBtnCombo']/button[@class='save']").text.strip).to(be==x.strip)
    end
    self
  end

  def assert_tuteset_ticksign
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='popupBtnCombo']/button[@class='save']").click
      expect(@session).to have_xpath("//*[@class='activeState'][@title='Remove from tuteset']")
    end
    self
  end

  def assert_tute_creation_message(arg)
    @session.within_frame 'mainiframe' do
      success_text = @session.find(:xpath, "//*[@class='statusmessages']/p[@class='success']").text.strip
      expect(success_text).to(be == arg.strip)
    end
    self
  end

  def assert_tute_count
    @session.within_frame 'mainiframe' do
      new_count = @session.find(:xpath, "//*[@class='span4'][1]//span[@class='userTuteCount']").text.strip
      expect(new_count.to_i).to eq(@tuteCount.to_i + 1)
      # expect(new_count.to_i).to eq(@tuteCount.to_i + 0)
    end
    LeftNavigation.new(@session)
  end

  def click_new_tuteset
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='itemHeading tuteItem'][text()='20161121072654']").click
    end
    self
  end

  def assert_current_blog_addition_in_tuteset
    item_heading_in_tuteset = @session.find(:xpath, "//*[@id='tuteListPop']//ul[@class='listTutes']//span[1]/a").text
    expect(item_heading_in_tuteset.strip).to(be==@@itemHeading)
    @session.find(:xpath, "//*[@class='crossOver'][@title='Close']").click
    self
  end
end