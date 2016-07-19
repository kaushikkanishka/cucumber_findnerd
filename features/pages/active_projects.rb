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
end