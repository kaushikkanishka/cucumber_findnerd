class ActiveProjects < Base
  def initialize(session)
    @session = session
  end

  def assert_new_project_title_placeholder
    @session.within_frame 'mainiframe' do
      placeholder = @session.find(:xpath, "//*[@id='node_title']")['placeholder']
      expect(placeholder.strip).to eq("Enter Project Title....")
    end
    self
  end

  def click_setup_project_button
    @session.within_frame 'mainiframe' do
      @session.find('#node_title').click
    end
    self
  end

  def assert_new_proj_save_close_btn
    @session.within_frame 'mainiframe' do
      @session.find('#node_title').set('Test new Proj Tiltle')
      expect(@session).to have_css('#saveContent')
      expect(@session).to have_css('.inner_closebtn')
    end
    self
  end

  def enter_new_project_proj_title
    @session.within_frame 'mainiframe' do
      @session.find('#node_title').set('Test new Project Title')
    end
    self
  end

  def click_new_proj_save_btn
    @session.within_frame 'mainiframe' do
      @session.find('#saveContent').click
    end
    self
  end

  def assert_proj_dashboard
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('.dashboard')
    end
    self
  end

  def assert_active_project_page
    @session.within_frame 'mainiframe' do
      sleep 2
      browser_back_button
      expect(@session).to have_css('#node_title')
    end
    self
  end

  # def assert_active_project_breadcrumb(arg)
  #   @session.within_frame 'mainiframe' do
  #     breadcrumb = Array.new
  #     @session.all(:xpath, "//*[@class='breadcrumb']/li").each do |value|
  #       breadcrumb.push value.text.strip
  #     end
  #     expect(breadcrumb.join(" ")).to eq(arg)
  #   end
  #   self
  # end

  def assert_new_proj_search_box
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('#text_search')
    end
    self
  end

  def assert_new_proj_search_button
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('.searchBtn')
    end
    self
  end

  def assert_active_proj_list_fields(option)
    @session.within_frame 'mainiframe' do
      case option
        when 'Project Title'
          expect(@session).to have_xpath("//*[@class='itemContent']/../../div[2]/div[@class='itemContent']/h4/a")
        when 'Meta data'
          xpath = "//*[@class='itemContent']/../../div[2]/div[@class='itemContent']/ul[@class='story-meta']"
          expect(@session).to have_xpath(xpath)
        when 'Project Description'
          xpath1 = "//*[@class='itemContent']/../../div[2]/div[@class='itemContent']/div[@class='content']"
          expect(@session).to have_xpath(xpath1)
        when 'Project Creator ID'
          xpath3 = "//*[@class='itemContent']/../../div[2]/div[@class='itemContent']/div[last()]/div[@class='userBox']"
          expect(@session).to have_xpath(xpath3)
        when 'View Count'
          xpath2 = "//*[@class='itemContent']/../../div[2]/div[@class='itemContent']/ul[@class='itemStatus']"
          expect(@session).to have_xpath(xpath2)
        when 'Voting bar'
          xpath4 = "//*[@class='itemContent']/../../div[1]/div[@class='itemContent']/ul[@class='itemStatus']"
          expect(@session).to have_xpath(xpath4)
      end
    end
    self
  end

  def assert_project_count
    @session.within_frame 'mainiframe' do
      @session.find('.next_page').click
        expect(@session).to have_css('.next_page')
    end
    self
  end

  def assert_user_card
    @session.within_frame 'mainiframe' do
      a = "//*[@class='itemContent']/../../div[1]//div[@class='userShareCover'][contains(@onmouseover,'showUserShare')]"
      expect(@session).to have_xpath(a)
    end
    self
  end

  def assert_right_rail_items(option)
    @session.within_frame 'mainiframe' do
      case option
        when 'Posted date dropdown'
          expect(@session).to have_xpath("//*[@id='posted'][@name='posted']")
        when 'Budget date dropdown'
          expect(@session).to have_xpath("//*[@id='budget'][@name='budget']")
        when 'Job Type'
          expect(@session).to have_xpath("//*[@id='jobtype1'][@name='jobtype']")
          expect(@session).to have_xpath("//*[@id='jobtype'][@name='jobtype']")
        when 'Max 5 Featured Posts'
          expect(@session).to have_css('.rightListing > li', maximum: 5)
        when 'Tags'
          expect(@session).to have_css('#tagDisplay')
      end
    end
    self
  end
end